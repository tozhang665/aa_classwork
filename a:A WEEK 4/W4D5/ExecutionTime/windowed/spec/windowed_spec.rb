
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
    expect(optimized_max_windowed_range([1, 0, 2, 5, 4, 8], 5)).to eq(6)
  end
end


