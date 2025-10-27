# state table 만드는 코드

import pandas as pd

# 기존 리스트 생성 부분
present_state_list = []

for i in range(16):
    binary_value = [int(x) for x in format(i, '04b')]
    present_state_list.extend([binary_value] * 4)

inputs_list = []

base_pattern = [[0, 0], [0, 1], [1, 0], [1, 1]]
for _ in range(16):
    inputs_list.extend(base_pattern)

full_answer_input = []
answer_input = [[0, 0], [0, 0], [1, 0], [1, 0], [1, 0], [0, 0], [1, 0], [1, 0], [0, 0], [1, 0], [1, 0], [0, 0], [0, 0], [0, 0], [1, 0], [1, 0]]
for i in range(16):
    for j in range(4):
        full_answer_input.append(answer_input[i])

# DataFrame을 위한 리스트 초기화
data = []

# 데이터프레임에 데이터를 추가하는 루프
for i in range(64):
    row = {}
    row['Present State'] = ' '.join(map(str, present_state_list[i]))
    row['Input'] = ' '.join(map(str, inputs_list[i]))
    
    try:
        if i >= 60 or i in [1, 2, 3]:
            expected_state = 'X X X X'
            t3, t2, t1, t0 = 'X', 'X', 'X', 'X'
        elif full_answer_input[i] == inputs_list[i]:
            expected_state = ' '.join(map(str, present_state_list[i + 4]))
            t3 = int(present_state_list[i][0] != present_state_list[i + 4][0])
            t2 = int(present_state_list[i][1] != present_state_list[i + 4][1])
            t1 = int(present_state_list[i][2] != present_state_list[i + 4][2])
            t0 = int(present_state_list[i][3] != present_state_list[i + 4][3])
        else:
            expected_state = '0 0 0 0'
            t3 = int(present_state_list[i][0] != 0)
            t2 = int(present_state_list[i][1] != 0)
            t1 = int(present_state_list[i][2] != 0)
            t0 = int(present_state_list[i][3] != 0)
    except:
        expected_state = 'X X X X'
        t3, t2, t1, t0 = 'X', 'X', 'X', 'X'

    row['T3'] = t3
    row['T2'] = t2
    row['T1'] = t1
    row['T0'] = t0
    row['Next State'] = expected_state
    
    data.append(row)

# DataFrame 생성
df = pd.DataFrame(data)

# DataFrame을 CSV 파일로 저장 (index 열 없이)
df.to_csv('state_transitions.csv', index=False)

print("DataFrame has been saved to 'state_transitions.csv' without index column.")
