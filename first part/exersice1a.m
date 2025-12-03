I = imread('parrot.png');

% Exersice 1a.

% Vector with all the dinstinct values of the matrix above.
symbols1 = unique(I);

% Vector that counts the number of times each symbol occurs in the matrix
% I.
counts1 = histc(I(:), symbols1);

% To find the probability of appearance of each symbol, we must divide each
%number in the counts vector with the number 3e4, which is the total
%elements in the I matrix.
%i-th value in symbols has the i-th symbol's prob of appearance.
probabilities1 = counts1 ./ 3e4;

% Exersice 1b

% We construct the huffman dictionary for the symbols 
huffdict1 = huffmandict(symbols1, probabilities1);

% We calculate the entropy of the huffman dictionary
ent1 = entropy(probabilities1);

% We calculate the average length of the huffman code.
lbar1 = 0;
for i = 1:16
    lbar1 = lbar1 + (probabilities1(i) * length(huffdict1{i,2})); 
end

% We calculate the efficiency of the huffman code, by dividing the entropy
% by the average length of the code.
eff1 = ent1 / lbar1;


% Exercise 2a. 

l1 = size(I);
imageLength = l1(1)*l1(2);

% First we turn the matrix of the image into a row vector.
Ires = reshape(I',[],1);

% We brake the vector into pairs, resembling the pairs the expansion of the
% source would produce.
Iproc = [Ires(1:2:end),Ires(2:2:end)];

% Based on Iproc, we find the unique pairs that is the alphabet of the
% expanded source.
[symbols2,column_labels,row_labels] = unique(Iproc, "rows");

% We count how many times each pair is founded in the Iproc matrix and we
% calculate the probability of appearance for each symbol.
counts2 = histcounts(row_labels, max(row_labels));
totalCount = sum(counts2);
probabilities2 = counts2 ./ totalCount;
probabilities2 = probabilities2';

% We calculate the entropy of the expansion of the source
ent2 = 0;

for i = 1 : 174 
    ent2 = ent2 - (probabilities2(i,1) * log2(probabilities2(i,1)));
end

% Reformatting the symbols2 matrix to a vector of strings.
symbols2form = cell(174,1);

for i = 1 : 174
    symbols2form{i} = [num2str(symbols2(i,1)), '-', num2str(symbols2(i,2))];
end

% We construct the huffman dictionary for the symbols
huffdict2 = huffmandict(symbols2form,probabilities2);

% We calculate the average length of the huffman code.
lbar2 = 0;
for i = 1:174
    lbar2 = lbar2 + (probabilities2(i,1) * length(huffdict2{i,2})); 
end

% We calculate the efficiency of the huffman code, by dividing the entropy
% by the average length of the code.
eff2 = ent2 / lbar2;


%Exercise 4.

% We encode the source using the huffman dictionary huff1 we found in the
% first exercise
encSrc = huffmanenco(Ires,huffdict1);

% We ensure the code works by decoding the encoded sequence using the same
% huffman dictionary.
decSrc = huffmandeco(encSrc, huffdict1);

% This is the binary depiction of the Image.
bI = reshape((dec2bin(typecast(I(:),'uint8'),4)-'0').',1,[]);

% We calculate the ratio between the bits used to encode the image using 
% the huffman dictionary and the bits used to binarize the image.
binaryToHuffmanRatio = length(encSrc) / length(bI);

% Now we want to determine the possibility of correct transmission through 
% the given channel by observing the vectors of input and output.

% First we pass the encoded vector through the channel.
output = binary_symmetric_channel(encSrc);

% We compare the two vectors to find where are the mistakes. The 1 in the
% comparison vector equals to a mistake.
comparison = xor(encSrc, output);
comparisonCounts = sum(comparison);

% We calculate the probabilitiy of the channel, by counting all the
% mistakes and dividing them with the lenght of the vector.
channelProb = comparisonCounts / length(encSrc);

% Because our channel is binary and symmetric, the capacity can be easily
% calculated as follows .
capacity = 1 + channelProb*log2(channelProb) + (1 - channelProb)*log2(1 - channelProb);

% Binary entropy function H(p)
H_p = @(p) -p * log2(p) - (1 - p) * log2(1 - p);
H_pe = H_p(channelProb);

% Mutual Information I(X; Y) in a BSC is equal to the channel capacity
mutual_information = 1 - H_pe;