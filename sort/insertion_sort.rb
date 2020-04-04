def insertion_sort(arr)
  # 새 배열을 만들고, arr 배열의 0번 index를 pop하여 넣어준다.
  result = []
  result << arr.shift

  # arr 배열의 길이가 1 이상일 때,
  while arr.length >= 1
    result.each_index do |index|
      # 새 배열을 순회하는 중, arr 배열의 0번 index보다 큰 값을 찾으면
      # arr 배열의 0번 index를 pop하여 새 배열의 index에 넣어주고 순회를 멈춘다.
      if arr[0] < result[index]
        result.insert(index, arr.shift)
        break
      end

      # 새 배열을 모두 순회하여도 0번 index보다 큰 값을 찾지 못하면
      # arr 배열의 0번 index를 pop하여 arr 배열의 마지막 index에 넣어준다.
      if index == result.length - 1
        result.append(arr.shift)
        # 새 값이 배열에 추가되어 순회가 계속 이루어지므로 순회를 멈추도록 한다.
        break
      end
    end
  end

  result
end

p insertion_sort([3, 8, 2, 5, 1])