unless Comparable.method_defined? :clamp
    module Comparable
        def clamp min, max
        if max-min<0
            raise ArgumentError, 'min argument must be smaller than max argument'
        end
        self>max ? max : self<min ? min : self
        end
    end
end