@benches.each do |selectedbench|
  json.set! selectedbench.id do
    json.partial! 'bench', bench: selectedbench
  end
end