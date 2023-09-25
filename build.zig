const std = @import("std");

const headers = &[_][]const u8{
    "mmap.hpp",
    "page.hpp",
    "shared_mmap.hpp",
    "detail/string_util.hpp",
    "detail/mmap.ipp",
};

pub fn build(b: *std.Build) !void {
    var inst_step = b.getInstallStep();
    for (headers) |header| {
        const h_step = b.addInstallHeaderFile(
            std.fs.path.join(b.allocator, &.{ "include", "mio", header }) catch @panic("OOM"),
            std.fs.path.join(b.allocator, &.{ "mio", header }) catch @panic("OOM"),
        );
        inst_step.dependOn(&h_step.step);
    }
}
