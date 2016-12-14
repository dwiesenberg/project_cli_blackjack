
  class Test

#    private

    def xxx
      puts "public method xxx"
    end

    def zzz
      puts "private method zzz"  
    end    

    def yyy
      puts "public method yyy"
    end

    public :xxx, :yyy

  end

test = Test.new
test.xxx
test.zzz


