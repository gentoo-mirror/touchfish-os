# include <compare>
# include <fmt/format.h>
# include <boost/process.hpp>

class Version_t
{
	protected: std::vector<std::string> Versions;
	public: Version_t(std::string string)
	{
		boost::algorithm::split(Versions, string, boost::is_any_of("."));
	}
	public: std::partial_ordering operator<=>(const Version_t& other) const
	{
		if (Versions.size() != Versions.size())
			return std::partial_ordering::unordered;
		for (size_t i = 0; i < Versions.size(); i++)
			if (Versions[Versions.size() - i - 1] != other.Versions[Versions.size() - i - 1])
				return Versions[Versions.size() - i - 1] <=> other.Versions[Versions.size() - i - 1];
		return std::partial_ordering::equivalent;
	}
};

int main()
{

}