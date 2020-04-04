def merge_sort(arr, first, last)
  mid = (first + last) / 2

  # 정렬을 시작하는 index 값이 끝 값보다 작을 경우,
  if first < last
    # 배열을 절반으로 나누어 재귀적으로 정렬한다.
    merge_sort(arr, first, mid)
    merge_sort(arr, mid + 1, last)
    result = merge(arr, arr[first..mid], arr[mid + 1..last], first, last)
  end

  result
end

def merge(arr, arr_first, arr_second, first, last)
  result = []

  # arr_first 배열의 크기가 1보다 크고, arr_second 배열의 크기가 1보다 클 때,
  while arr_first.length >= 1 && arr_second.length >= 1
    # arr_first 배열의 0번 index의 값이 arr_second 배열의 0번 index의 값보다 작으면,
    if arr_first[0] < arr_second[0]
      # arr_first 배열의 0번 index의 값을 pop하여 새 배열에 추가한다.
      result.append(arr_first.shift)
    else
      # 아니면(크거나 같으면), arr_second 배열의 0번 index의 값을 pop하여 새 배열에 추가한다.
      result.append(arr_second.shift)
    end
  end

  # arr_first 또는 arr_second중 하나가 모두 pop 되면 정렬이 종료되므로,
  # 남은 값들을 모두 더하여 정렬한 새 배열을 arr 배열에 적용시킨다.
  arr[first..last] = result + arr_first + arr_second
end

p merge_sort([4, 6, 1, 3, 5, 2], 0, 5)
