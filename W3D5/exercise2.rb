class Queue
    attr_reader :arr
    def initialize
        arr = []
    end

    def enqueue(el)
        arr.push(el)
        el
    end

    def dequeue
        arr.shift 
    end

    def peek
        arr.last
    end
end