# logic gate 식에 값을 대입해보면서 결과를 확인하는 코드

def generate_binary_list():
    binary_list = []
    for i in range(64):
        binary_representation = [int(x) for x in format(i, '06b')]
        binary_list.append(binary_representation)
    return binary_list

bbinary_list = generate_binary_list()

def calculate_T3(Q3, Q2, Q1, Q0, X1, X0):
    # NOT operations
    Q3_not = not Q3
    Q2_not = not Q2
    Q1_not = not Q1
    Q0_not = not Q0
    X1_not = not X1
    X0_not = not X0

    # XOR operations
    X1_xor_Q1_xor_Q0 = X1 ^ Q1 ^ Q0

    # Calculate each term
    term1 = Q3_not and Q2 and Q1 and Q0 and X1 and X0_not
    term2 = Q3 and Q2_not and (X0 or X1_xor_Q1_xor_Q0)
    term3 = Q3 and Q2 and (X0 or (Q1_not and X1) or (Q1 and X1_not))

    # Calculate T3
    T3 = term1 or term2 or term3
    
    # Convert T3 to an integer (0 or 1)
    T3 = int(T3)

    return T3





def calculate_T2(Q3, Q2, Q1, Q0, X1, X0):
    # NOT operations
    Q3_not = not Q3
    Q2_not = not Q2
    Q1_not = not Q1
    Q0_not = not Q0
    X1_not = not X1
    X0_not = not X0

    # Calculate each term
    term1 = Q3_not and Q2_not and Q1 and Q0 and X1 and X0_not
    term2 = Q3_not and Q2 and ((Q1 and X1_not) or X0 or (Q0 and X1) or (Q1_not and Q0_not and X1_not))
    term3 = Q3 and Q2_not and Q1 and Q0 and X1_not and X0_not
    term4 = Q3 and Q2 and (X0 or (Q1_not and X1) or (Q1 and X1_not))

    # Calculate T2
    T2 = term1 or term2 or term3 or term4
    
    # Convert T2 to an integer (0 or 1)
    T2 = int(T2)

    return T2


def calculate_T1(Q3, Q2, Q1, Q0, X1, X0):
    # NOT operations
    Q3_not = not Q3
    Q2_not = not Q2
    Q1_not = not Q1
    Q0_not = not Q0
    X1_not = not X1
    X0_not = not X0

    # Calculate each term
    # Term 1: Q3’Q2’(Q1Q0 + Q1X1’ + Q1X0 + Q0X1’X0’)
    term1_part1 = Q1 and Q0
    term1_part2 = Q1 and X1_not
    term1_part3 = Q1 and X0
    term1_part4 = Q0 and X1_not and X0_not
    term1_inner = term1_part1 or term1_part2 or term1_part3 or term1_part4
    term1 = Q3_not and Q2_not and term1_inner

    # Term 2: Q3’Q2(Q1Q0 + Q1X1’ + Q1X0 + Q0X1’X0’)
    term2_inner = term1_inner  # Same as term1_inner
    term2 = Q3_not and Q2 and term2_inner

    # Term 3: Q3Q2’(Q1X1’ + Q1X0 + Q1Q0 + Q0X1X0’)
    term3_part1 = Q1 and X1_not
    term3_part2 = Q1 and X0
    term3_part3 = Q1 and Q0
    term3_part4 = Q0 and X1 and X0_not
    term3_inner = term3_part1 or term3_part2 or term3_part3 or term3_part4
    term3 = Q3 and Q2_not and term3_inner

    # Term 4: Q3Q2(Q1X1’ + Q1X0 + Q0X1’X0’)
    term4_part1 = Q1 and X1_not
    term4_part2 = Q1 and X0
    term4_part3 = Q0 and X1_not and X0_not
    term4_inner = term4_part1 or term4_part2 or term4_part3
    term4 = Q3 and Q2 and term4_inner

    # Calculate T1
    T1 = term1 or term2 or term3 or term4
    
    # Convert T1 to an integer (0 or 1)
    T1 = int(T1)

    return T1


def calculate_T0(Q3, Q2, Q1, Q0, X1, X0):
    # NOT operations
    Q3_not = not Q3
    Q2_not = not Q2
    Q1_not = not Q1
    Q0_not = not Q0
    X1_not = not X1
    X0_not = not X0

    # Calculate each term
    # Term 1: Q3’Q2’(Q1‘ + Q0 + X1X0’)
    term1_part1 = Q1_not
    term1_part2 = Q0
    term1_part3 = X1 and X0_not
    term1_inner = term1_part1 or term1_part2 or term1_part3
    term1 = Q3_not and Q2_not and term1_inner

    # Term 2: Q3’Q2(Q0 + X1X0’)
    term2_part1 = Q0
    term2_part2 = X1 and X0_not
    term2_inner = term2_part1 or term2_part2
    term2 = Q3_not and Q2 and term2_inner

    # Term 3: Q3Q2’(Q0 + Q1’X1’X0’ + Q1X1X0’)
    term3_part1 = Q0
    term3_part2 = Q1_not and X1_not and X0_not
    term3_part3 = Q1 and X1 and X0_not
    term3_inner = term3_part1 or term3_part2 or term3_part3
    term3 = Q3 and Q2_not and term3_inner

    # Term 4: Q3Q2(Q0 + Q1’X1’X0’ + Q1X1X0’)
    term4_part1 = Q0
    term4_part2 = Q1_not and X1_not and X0_not
    term4_part3 = Q1 and X1 and X0_not
    term4_inner = term4_part1 or term4_part2 or term4_part3
    term4 = Q3 and Q2 and term4_inner

    # Calculate T0
    T0 = term1 or term2 or term3 or term4
    
    # Convert T0 to an integer (0 or 1)
    T0 = int(T0)

    return T0


def calculate_Z(Q3, Q2, Q1, Q0):
    # Calculate Z
    Z = Q3 and Q2 and Q1 and Q0
    
    Z = int(Z)
    
    return Z

for llist in bbinary_list:
    #print(calculate_T3(llist[0], llist[1], llist[2], llist[3], llist[4], llist[5]), calculate_T2(llist[0], llist[1], llist[2], llist[3], llist[4], llist[5]), calculate_T1(llist[0], llist[1], llist[2], llist[3], llist[4], llist[5]), calculate_T0(llist[0], llist[1], llist[2], llist[3], llist[4], llist[5]), calculate_Z(llist[0], llist[1], llist[2], llist[3])) Z까지
    print(calculate_T3(llist[0], llist[1], llist[2], llist[3], llist[4], llist[5]), calculate_T2(llist[0], llist[1], llist[2], llist[3], llist[4], llist[5]), calculate_T1(llist[0], llist[1], llist[2], llist[3], llist[4], llist[5]), calculate_T0(llist[0], llist[1], llist[2], llist[3], llist[4], llist[5]))

