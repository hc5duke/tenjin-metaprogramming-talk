all: exa exb exc exd

exa:
	bundle exec rspec ex0/

exb:
	bundle exec rspec ex1/

exc:
	bundle exec rspec ex2/

exd:
	ruby spec/ex3/ex3_bench.rb
