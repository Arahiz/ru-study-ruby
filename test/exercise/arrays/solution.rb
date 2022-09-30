module Exercise
  module Arrays
    class << self
      def search_max(array)
        max_elem = array[0]
        array.each do |elem|
          max_elem = elem if elem > max_elem
        end
        max_elem
      end

      def replace(array)
        max_elem = search_max(array)
        array.map { |el| el.positive? ? max_elem : el }
      end

      def search(array, query, left = 0, right = array.length - 1)
        return -1 if query < array[left] || query > array[right]

        mid_position = (left + right) / 2
        return mid_position if array[mid_position] == query

        return -1 if left == right

        array[mid_position] > query ? search(array, query, left, mid_position - 1) : search(array, query, mid_position + 1, right)
      end
    end
  end
end
