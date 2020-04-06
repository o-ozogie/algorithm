# 순열 알고리즘
def permutation(array, count = 0)
  # 만약 함수가 인덱스의 최댓값만큼 호출 되었으면, 그 이상 호출할 필요 없으므로 array를 출력한다.
  if count == array.length - 1
    p array
  else
    # 아니면 배열의 인덱스 값을 순회하며 count 값과 바꾼 후, 해당 배열을 인자로 permutation 함수를 재귀호출 한다.
    # 재귀호출 후, 배열을 원상복구하고 이를 반복한다.
    (count..array.length - 1).each do |index|
      array[count], array[index] = array[index], array[count]
      permutation(array, count + 1)
      array[count], array[index] = array[index], array[count]
    end
  end
end

permutation([1, 2, 3])