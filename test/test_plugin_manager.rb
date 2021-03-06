require "helper"

class TestPluginManager < BuntoUnitTest
  def with_no_gemfile
    FileUtils.mv "Gemfile", "Gemfile.old"
    yield
  ensure
    FileUtils.mv "Gemfile.old", "Gemfile"
  end

  def test_requiring_from_bundler
    with_env("BUNTO_NO_BUNDLER_REQUIRE", nil) do
      assert Bunto::PluginManager.require_from_bundler,
             "require_from_bundler should return true."
      assert ENV["BUNTO_NO_BUNDLER_REQUIRE"], "Gemfile plugins were not required."
    end
  end

  def test_blocking_requiring_from_bundler
    with_env("BUNTO_NO_BUNDLER_REQUIRE", "true") do
      assert_equal false, Bunto::PluginManager.require_from_bundler,
                   "Gemfile plugins were required but shouldn't have been"
      assert ENV["BUNTO_NO_BUNDLER_REQUIRE"]
    end
  end

  def test_no_gemfile
    with_env("BUNTO_NO_BUNDLER_REQUIRE", nil) do
      with_no_gemfile do
        assert_equal false, Bunto::PluginManager.require_from_bundler,
                     "Gemfile plugins were required but shouldn't have been"
        assert_nil ENV["BUNTO_NO_BUNDLER_REQUIRE"]
      end
    end
  end
end
