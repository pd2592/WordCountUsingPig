--A script for word count
A = load 'wordcount.txt' using PigStorage('\n') as(line:chararray);
B = foreach A generate TOKENIZE(line, ' ') as words;
C = foreach B generate FLATTEN(words) as word;
D = group C by word;
E = foreach D generate group, COUNT(C);
ordrE = order E by group;
store ordrE into 'pigwordcountoutputordrE';
dump ordrE;
