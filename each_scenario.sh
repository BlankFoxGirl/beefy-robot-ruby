#!/bin/bash
echo "Starting with a set of unit tests."
bundle exec rspec

echo "Running scenario on example A."
cat example_a.txt
echo ""
echo "=============="
ruby run.rb example_a.txt
echo "=============="

echo "Running scenario on example B."
cat example_b.txt
echo ""
echo "=============="
ruby run.rb example_b.txt
echo "=============="

echo "Running scenario on example C."
cat example_c.txt
echo ""
echo "=============="
ruby run.rb example_c.txt
echo "=============="

echo "Running scenario on example D."
cat example_d.txt
echo ""
echo "=============="
ruby run.rb example_d.txt
echo "=============="
echo "Automated scenarios are completed."