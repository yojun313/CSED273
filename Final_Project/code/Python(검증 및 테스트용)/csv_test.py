import pandas as pd

# CSV 파일 읽기
file_path = 'state_transitions.csv'
file_path = '/Users/yojunsmacbookprp/Library/Mobile Documents/com~apple~CloudDocs/POSTECH/2-1학기/디지털시스템설계/파이널 프로젝트/디시설 표.csv'
df = pd.read_csv(file_path)

# 각 행을 문자열로 변환하여 리스트에 저장
rows_as_strings = []
for index, row in df.iterrows():
    row_string = ' '.join(map(str, row.values))
    rows_as_strings.append(row_string)

# 리스트 출력
for row in rows_as_strings:
    print(row)