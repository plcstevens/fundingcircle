require_relative "spec_helper"

describe FundingCircle do
  before :each do
    @run = FundingCircle::GenerateTables.new
  end

  describe "#generate_multi_array" do
    it "should return an array" do
      example_array = [2, 3]
      @run.instance_eval { generate_multi_array(example_array) }.should be_kind_of Array
    end

    it "should produce the correct output given a specific input" do
      example_array = [2, 3]
      @run.instance_eval { generate_multi_array(example_array) }.should eql [["", 2, 3], [2, 4, 6], [3, 6, 9]]
    end

    it "should return an empty array when given one" do
      @run.instance_eval { generate_multi_array([]) }.should eql []
    end
  end

  describe "#generate_prime_numbers" do
    it "should return an array" do
      0.upto(100) do |x|
        @run.instance_eval { generate_prime_numbers(x) }.should be_kind_of Array
      end
    end

    it "should produce an empty array on 0 prime numbers" do
      @run.instance_eval { generate_prime_numbers(0) }.should eql []
    end

    it "should produce the same set of prime numbers given the same amount" do
      @run.instance_eval { generate_prime_numbers(10) }.should eql @run.instance_eval { generate_prime_numbers(10) }
    end

    it "should produce the correct set of prime numbers given the default value" do
      @run.instance_eval { generate_prime_numbers(10) }.should eql [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    end
  end

  describe "#next_prime" do
    it "should return an integer" do
      0.upto(100) do |x|
        @run.instance_eval { next_prime(x) }.should be_kind_of Integer
      end
    end

    it "should find the next valid integer given a negative integer" do
      @run.instance_eval { next_prime(-1) }.should be_kind_of Integer
    end

    it "should always return the correct next prime" do
      @run.instance_eval { next_prime(2) }.should eql 3
    end
  end

  describe "#is_prime?" do
    it "should return an boolean" do
      0.upto(100) do |x|
        [true, false].should include(@run.instance_eval { is_prime?(x) })
      end
    end

    it "should not return true for testing if one is a prime number" do
      @run.instance_eval { is_prime?(1) }.should_not eql true
    end

    it "should return true for testing if two is a prime number" do
      @run.instance_eval { is_prime?(2) }.should eql true
    end

    it "should return true for testing if twenty nine is a prime number" do
      @run.instance_eval { is_prime?(29) }.should eql true
    end
  end

end
