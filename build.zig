const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    _ = b.addModule("buddy2", .{
        .root_source_file = .{ .path = "src/buddy2.zig" },
    });

    const main_tests = b.addTest(.{
        .root_source_file = .{ .path = "src/buddy2.zig" },
        .target = target,
        .optimize = optimize,
    });

    const run_main_tests = b.addRunArtifact(main_tests);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&run_main_tests.step);
}
