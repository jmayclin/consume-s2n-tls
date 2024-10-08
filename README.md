# from_install (fine)

This shows how to consume s2n-tls when s2n-tls is consumed as an installed library.

# from_add_subdirectory (no)

This shows how to consume s2n-tls as an "in-source" dependency. PLEASE DON'T DO THIS. We have to do lots of configuration, and that is basically impossible to do from this perspective. You should instead you [try_compile](from_try_compile). 

# from_try_compile (no)

This shows how to consume s2n-tls as a "source" dependency that is compiled and configured using cmake's `try_compile` feature. This surprisingly worked, but also very tedious. It looks like external project is intended to fully support this use case.

# from_external_project (maybe)

There are some build orderings going on. The internet is basically telling me that I was stupid to try this and that I should be using fetchContext instead?

My understanding is that this will shove all of the correct build/configure/etc targets into your thing, but that there isn't an easy way to actually consume any of those declared targets inside the current CMakeLists scope. So it's pretty useless for my use cases.

# from_fetch_content (probably)

I think this is the "nice" way to do it? You can fetch the content which will clone all of the source and do a minimum of the CMakeLists parsing at compile time which makes the targets actually available. Then it seems that the actual configure/etc steps are still run as part of the actual _build_ graph.

I'm still not totally clear on how to actually consume these things from one project to another. But confident that external project or fetch content would provide a path forward.
