require "test/unit"
require_relative "../lib/shape/branch.rb"
class BranchTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_rebase
   assert_raise(Errno::ENOENT){Branch.integrate('abc','cdf')}
  end

  def test_update_version
    assert_raise(Errno::ENOENT){Branch.update_version('path','oldv','newv')}
  end
end