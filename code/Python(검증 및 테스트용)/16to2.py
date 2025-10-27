# vivado에서 맵이 잘 작동되는지 확인하기 위한 16->2진수 변환기

def hex_to_bin(hex_value):
    # Remove the '0x' prefix if present
    if hex_value.startswith('0x'):
        hex_value = hex_value[2:]

    # Convert each hex digit to its 4-bit binary representation
    binary_value = bin(int(hex_value, 16))[2:].zfill(len(hex_value) * 4)
    binary_value = str(binary_value)
    binary_value = binary_value[::-1]
    return binary_value

# Example usage

hex_value = "0004040c382020e0"
hex_value = "5a5a4242ff422418"

binary_value = hex_to_bin(hex_value)
print(f"Hex: {hex_value}")
print(f"Binary: {binary_value}")