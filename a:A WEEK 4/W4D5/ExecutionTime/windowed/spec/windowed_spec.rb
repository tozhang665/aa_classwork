
require "windowed"

describe "naive_max_windowed_range" do
  it "find the maximum range (max - min) within a set of w elements" do
    expect(naive_max_windowed_range([1, 0, 2, 5, 4, 8], 2)).to eq(4)
    expect(naive_max_windowed_range([1, 0, 2, 5, 4, 8], 3)).to eq(5)
    expect(naive_max_windowed_range([1, 0, 2, 5, 4, 8], 4)).to eq(6)
    expect(naive_max_windowed_range([1, 3, 2, 5, 4, 8], 5)).to eq(6)
  end
end



describe "optimized_max_windowed_range" do
  it "find the maximum range (max - min) within a set of w elements" do
    expect(optimized_max_windowed_range([1, 0, 2, 5, 4, 8], 2)).to eq(4)
    expect(optimized_max_windowed_range([1, 0, 2, 5, 4, 8], 3)).to eq(5)
    expect(optimized_max_windowed_range([1, 0, 2, 5, 4, 8], 4)).to eq(6)
    expect(optimized_max_windowed_range([1, 3, 2, 5, 4, 8], 5)).to eq(6)
  end
end


describe "four_two_sum?" do
  it "determine whether any two integers in the array sum to that amount." do
    # true tests
    # expect(four_sum?([0, 1, 5, 7], 13)).to be(true)
    expect(four_sum?([4, 5, 1, 8], 18)).to be(true)

    # false tests
    expect(four_sum?([4, 5, 1, 8], 0)).to be(false)
    expect(four_sum?([0, 1, 5, 7], 10)).to be(false)
    expect(four_sum?([4, 5, 1, 8], -1)).to be(false)
    expect(four_sum?([4, 5, 1, 8], 2)).to be(false)
    expect(four_sum?([4, 5, 1, 8], 3)).to be(false)
    expect(four_sum?([4, 5, 1, 8], 1)).to be(false)
    expect(four_sum?([4, 5, 1, 8], 4)).to be(false)
    expect(four_sum?([4, 5, 1, 8], 7)).to be(false)
    expect(four_sum?([4, 5, 1, 8], 8)).to be(false)
  end
end