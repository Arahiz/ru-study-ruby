module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        index = 0
        while index < length
          yield self[index]
          index += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result_array = MyArray.new
        my_reduce(result_array, &->(handled_array, current_elem) { handled_array << yield(current_elem) })
      end

      # Написать свою функцию my_compact
      def my_compact
        result_array = MyArray.new
        my_reduce(result_array, &->(handled_array, current_elem) { current_elem.nil? ? handled_array : handled_array << current_elem })
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        if acc
          index = 0
        else
          index = 1
          acc = self[0]
        end
        while index < length
          acc = yield(acc, self[index])
          index += 1
        end
        acc
      end
    end
  end
end
