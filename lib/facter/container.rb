# Fact: container
#
# Purpose:
#   Returns the container type.
#
# Test:
# # facter -p container
# docker
#
# Caveats:
#

Facter.add(:container) do
  confine { Facter.value(:kernelversion) =~ /^JNPR/ }
  setcode do
    query = "/docker"
    arr = File.readlines("/proc/1/cgroup").grep /#{query}/i
    if arr.any?
       "docker"
    else
       false
    end
  end
end
