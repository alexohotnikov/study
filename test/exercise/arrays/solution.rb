module Exercise
  module Arrays
    class << self
      def get_max_elemnt(array)
        #  not cool:
        count = 0
        current_max_element = array[0]
        while count < array.size - 1
          count += 1
          current_max_element = array[count] if array[count] > current_max_element
        end
        current_max_element
        # # best solution:
        # array.sort.last
      end
      def replace(array)
        max = self.get_max_elemnt(array)
        out = []
        # maybe cool use '.each'?:)
        for i in array 
            out.push i > 0 ? max : i
        end
        out
      end
      def bserach_iter(array, query, startIndex, endIndex)
        middle = (startIndex + endIndex) / 2
        return middle if array[middle] == query
        if startIndex >= endIndex
          return -1
        elsif query < array[middle]
          bserach_iter(array, query, startIndex, middle - 1)
        elsif query > array[middle]
          bserach_iter(array, query, middle + 1, endIndex)
        end
      end

      def search(array, query)
        startIndex = 0
        endIndex = array.size - 1
        return -1 if array.size == 0 || array.last < query
        self.bserach_iter(array, query, startIndex, endIndex)
      end

    end
  end
end

