def partition(arr, first, last)
  count = first
  i = first

  # 배열을 first부터 last까지 순회한다.
  while i < last
    # 순회하는 중 기준값(여기서는 last)보다 작은 값을 발견할 경우 count의 값과 교환한다.
    # 이후 count를 +1 하여 기준값보다 작은 값들을 count index 뒤로 미루어 둔다.
    if arr[i] < arr[last]
      arr[i], arr[count] = arr[count], arr[i]
      count += 1
    end
    i += 1
  end

  # 순회가 모두 끝난 뒤, count index의 값(기준값보다 큰 값과 작은 값을 나누는 경계)과 기준 값을 교환한다.
  # 그리고 기준값의 인덱스를 반환한다.
  arr[last], arr[count] = arr[count], arr[last]
  count
end

def quick_sort(arr, first, last)
  if first < last
    # partition 함수에서 반환된 기준값을 가지고 기준값을 제외한 기준값의 왼쪽, 오른쪽을 다시 정렬한다.
    pivot = partition(arr, first, last)

    quick_sort(arr, first, pivot - 1)
    quick_sort(arr, pivot + 1, last)
  end

  arr
end

arr = [8, 13, 1, 6, 1, 4]
p quick_sort(arr, 0, 5)
