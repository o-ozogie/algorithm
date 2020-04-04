def bubble_sort(arr)
  result = []

  # 배열의 길이가 1 이상일 때,
  while arr.length >= 1
    arr.each_index do |index|
      # 배열을 순회하는 중 배열의 마지막 index일 경우 배열을 끝낸다.
      break if index == arr.length - 1

      # 마지막 index가 아니라면 현재 가리키고 있는 index의 값과,
      # index의 앞 값을 비교하여 index의 값이 더 큰 경우, 둘을 교환한다.
      if arr[index] > arr[index + 1]
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
      end
    end

    # 순회가 끝난 후, 배열의 마지막 index를 pop하여 새 배열의 맨 앞에 추가한다.
    result.unshift(arr.pop)
  end

  result
end

p bubble_sort([6, 5, 3, 1])