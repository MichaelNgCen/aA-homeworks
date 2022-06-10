class Stack
    attr_reader :arr
    def initialize
      arr = []
    end

    def push(el)
      arr.push(el)
      el
    end

    def pop
      arr.pop(el)
    end

    def peek
        arr.last
    end
  end