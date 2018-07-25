a = 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'

print(a.count('A'), a.count('C'), a.count('G'), a.count('T'))

a = 'GATGGAACTTGACTACGTAAATT'
a = a.replace('T', 'U')
print(a)


d = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
a = 'GTCA'
print(''.join(d[i] for i in reversed(a)))
