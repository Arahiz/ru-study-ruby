module Exercise
  module Arrays
    class << self
      def replace(array)
        max_elem = array[0]
        array.each do |elem|
          max_elem = elem if elem > max_elem
        end
        index = 0
        array.each do |elem|
          array[index] = max_elem if elem.positive?
          index += 1
        end
        array
      end

      def search(array, query)
        return -1 if array.length.zero?

        mid_position = array.length / 2
        return mid_position if array[mid_position] == query

        if _array[mid_position] < query
          recursive_res = search(array[mid_position + 1..array.length - 1], query)
          return -1 if recursive_res == -1

          return mid_position + 1 + recursive_res
        end
        search(array[0..mid_position - 1], query)
      end
    end
  end
end
