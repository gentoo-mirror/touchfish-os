# include <boost/process.hpp>
# include <string>
# include <regex>
# include <vector>
# include <fmt/format.h>
# include <fmt/ranges.h>

struct Package
{
	std::string name;
	std::string version;
	std::string description;
	std::string download_url;
	std::vector<std::string> dependencies;
};

std::vector<std::string> exec(std::string command)
{
	boost::process::ipstream command_output;
	boost::process::child child
	{
		boost::process::search_path("sudo"), "systemd-run", "-M", "ubuntu-22.04", "--wait", "--quiet", "-P",
		"bash", "-c", command,
		boost::process::std_out > command_output
	};
	child.wait();
	std::vector<std::string> result;
	while (!command_output.eof())
	{
		result.emplace_back();
		std::getline(command_output, result.back());
	}
	if (result.back() == "")
		result.pop_back();
	return result;
}

Package query(std::string name)
{
	return Package
	{
		name,
		exec("apt show " + name + R"( 2> /dev/null | grep Version | sed -E 's/-([0-9]+)$/\.\1/g' | awk '{print $2}')")[0],
		exec("apt show " + name + " 2> /dev/null | grep Description | cut -d ' ' -f 2-")[0],
		exec("apt download --print-uris " + name + R"( 2> /dev/null | cut -d ' ' -f 1 | sed -E "s/'//g")")[0],
		exec("apt show " + name + R"( 2> /dev/null | grep Depends | sed 's/: /:\n/g' | sed 's/, /\n/g' | sed -E 's/^(.*) \(>= (.*)\)$/>=\1-\2/g' | sed -E 's/-([0-9]+)$/\.\1/g' | grep -v "Depends:" | sort)")
	};
}

int main()
{
	auto result = query("intel-hpckit");
	fmt::print("found {} {} {} {} {}\n", result.name, result.version, result.description, result.download_url, result.dependencies);
}