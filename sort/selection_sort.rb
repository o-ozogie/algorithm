def selection_sort(arr)
  result = []

  # 배열의 길이가 1 이상일 때,
  while arr.length >= 1
    # min 변수는 배열의 최소값이 있는 index를 저장하는 변수.
    # min 변수를 배열을 한 번 순회할 때 마다 0으로 초기화한다.
    min = 0

    # 배열을 순회하여 얻은 최소값의 index를 min에 저장한다.
    arr.each_index do |index|
      min = index if arr[index] < arr[min]
    end

    # 그리고 배열의 min번 index 값과 배열의 첫 번째 index 값을 교환한다.
    arr[min], arr[0] = arr[0], arr[min]

    # 이후 배열의 첫 번째 값을 pop하여 새 배열에 추가한다.
    result << arr.shift
  end

  result
end

p selection_sort([4, 6, 1, 3, 5, 2])
