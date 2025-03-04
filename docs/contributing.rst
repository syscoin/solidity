############
Contributing
############

Help is always welcome and there are plenty of options how you can contribute to Solidity.

In particular, we appreciate support in the following areas:

* Reporting issues.
* Fixing and responding to `Solidity's GitHub issues
  <https://github.com/ethereum/solidity/issues>`_, especially those tagged as
  `"good first issue" <https://github.com/ethereum/solidity/labels/good%20first%20issue>`_ which are
  meant as introductory issues for external contributors.
* Improving the documentation.
* Translating the documentation into more languages.
* Responding to questions from other users on `StackExchange
  <https://ethereum.stackexchange.com>`_ and the `Solidity Gitter Chat
  <https://gitter.im/ethereum/solidity>`_.
* Getting involved in the language design process by proposing language changes or new features in the `Solidity forum <https://forum.soliditylang.org/>`_ and providing feedback.

To get started, you can try :ref:`building-from-source` in order to familiarize
yourself with the components of Solidity and the build process. Also, it may be
useful to become well-versed at writing smart-contracts in Solidity.

Please note that this project is released with a `Contributor Code of Conduct <https://raw.githubusercontent.com/ethereum/solidity/develop/CODE_OF_CONDUCT.md>`_. By participating in this project - in the issues, pull requests, or Gitter channels - you agree to abide by its terms.

Team Calls
==========

If you have issues or pull requests to discuss, or are interested in hearing what
the team and contributors are working on, you can join our public team calls:

- Mondays at 3pm CET/CEST.
- Wednesdays at 2pm CET/CEST.

Both calls take place on `Jitsi <https://meet.komputing.org/solidity>`_.

How to Report Issues
====================

To report an issue, please use the
`GitHub issues tracker <https://github.com/ethereum/solidity/issues>`_. When
reporting issues, please mention the following details:

* Solidity version.
* Source code (if applicable).
* Operating system.
* Steps to reproduce the issue.
* Actual vs. expected behaviour.

Reducing the source code that caused the issue to a bare minimum is always
very helpful and sometimes even clarifies a misunderstanding.

Workflow for Pull Requests
==========================

In order to contribute, please fork off of the ``develop`` branch and make your
changes there. Your commit messages should detail *why* you made your change
in addition to *what* you did (unless it is a tiny change).

If you need to pull in any changes from ``develop`` after making your fork (for
example, to resolve potential merge conflicts), please avoid using ``git merge``
and instead, ``git rebase`` your branch. This will help us review your change
more easily.

Additionally, if you are writing a new feature, please ensure you add appropriate
test cases under ``test/`` (see below).

However, if you are making a larger change, please consult with the `Solidity Development Gitter channel
<https://gitter.im/ethereum/solidity-dev>`_ (different from the one mentioned above, this one is
focused on compiler and language development instead of language usage) first.

New features and bugfixes should be added to the ``Changelog.md`` file: please
follow the style of previous entries, when applicable.

Finally, please make sure you respect the `coding style
<https://github.com/ethereum/solidity/blob/develop/CODING_STYLE.md>`_
for this project. Also, even though we do CI testing, please test your code and
ensure that it builds locally before submitting a pull request.

Thank you for your help!

Running the Compiler Tests
==========================

Prerequisites
-------------

Some tests require the `evmone <https://github.com/ethereum/evmone/releases>`_
library, others require `libz3 <https://github.com/Z3Prover/z3>`_. The test script
tries to discover the location of the ``evmone`` library, which can be located
in the current directory, installed on the system level, or the ``deps`` folder
in the project top level. The required file is called ``libevmone.so`` on Linux
systems, ``evmone.dll`` on Windows systems and ``libevmone.dylib`` on macOS.

On macOS some of the testing scripts expect GNU coreutils to be installed.
This can be easiest accomplished using Homebrew: ``brew install coreutils``.

Running the Tests
-----------------

Solidity includes different types of tests, most of them bundled into the
`Boost C++ Test Framework <https://www.boost.org/doc/libs/1_69_0/libs/test/doc/html/index.html>`_ application ``soltest``.
Running ``build/test/soltest`` or its wrapper ``scripts/soltest.sh`` is sufficient for most changes.

The ``./scripts/tests.sh`` script executes most Solidity tests automatically,
including those bundled into the `Boost C++ Test Framework <https://www.boost.org/doc/libs/1_69_0/libs/test/doc/html/index.html>`_ application ``soltest`` (or its wrapper ``scripts/soltest.sh``),
as well as command line tests and compilation tests.

The test system automatically tries to discover the location of the ``evmone`` library
starting from the current directory. The required file is called ``libevmone.so`` on Linux systems,
``evmone.dll`` on Windows systems and ``libevmone.dylib`` on macOS. If it is not found, tests that
use it are skipped. These tests are ``libsolididty/semanticTests``, ``libsolidity/GasCosts``,
``libsolidity/SolidityEndToEndTest``, part of the soltest suite. To run all tests, download the library from
`GitHub <https://github.com/ethereum/evmone/releases/tag/v0.7.0>`_
and place it in the project root path or inside the ``deps`` folder.

If the ``libz3`` library is not installed on your system, you should disable the
SMT tests by exporting ``SMT_FLAGS=--no-smt`` before running ``./scripts/tests.sh`` or
running ``./scripts/soltest.sh --no-smt``.
These tests are ``libsolidity/smtCheckerTests`` and ``libsolidity/smtCheckerTestsJSON``.

.. note ::

    To get a list of all unit tests run by Soltest, run ``./build/test/soltest --list_content=HRF``.

For quicker results you can run a subset of, or specific tests.

To run a subset of tests, you can use filters:
``./scripts/soltest.sh -t TestSuite/TestName``,
where ``TestName`` can be a wildcard ``*``.

Or, for example, to run all the tests for the yul disambiguator:
``./scripts/soltest.sh -t "yulOptimizerTests/disambiguator/*" --no-smt``.

``./build/test/soltest --help`` has extensive help on all of the options available.

See especially:

- `show_progress (-p) <https://www.boost.org/doc/libs/1_69_0/libs/test/doc/html/boost_test/utf_reference/rt_param_reference/show_progress.html>`_ to show test completion,
- `run_test (-t) <https://www.boost.org/doc/libs/1_69_0/libs/test/doc/html/boost_test/utf_reference/rt_param_reference/run_test.html>`_ to run specific tests cases, and
- `report-level (-r) <https://www.boost.org/doc/libs/1_69_0/libs/test/doc/html/boost_test/utf_reference/rt_param_reference/report_level.html>`_ give a more detailed report.

.. note ::

    Those working in a Windows environment wanting to run the above basic sets
    without libz3. Using Git Bash, you use: ``./build/test/Release/soltest.exe -- --no-smt``.
    If you are running this in plain Command Prompt, use ``.\build\test\Release\soltest.exe -- --no-smt``.

If you want to debug using GDB, make sure you build differently than the "usual".
For example, you could run the following command in your ``build`` folder:
.. code-block:: bash

   cmake -DCMAKE_BUILD_TYPE=Debug ..
   make

This creates symbols so that when you debug a test using the ``--debug`` flag,
you have access to functions and variables in which you can break or print with.

The CI runs additional tests (including ``solc-js`` and testing third party Solidity
frameworks) that require compiling the Emscripten target.

Writing and Running Syntax Tests
--------------------------------

Syntax tests check that the compiler generates the correct error messages for invalid code
and properly accepts valid code.
They are stored in individual files inside the ``tests/libsolidity/syntaxTests`` folder.
These files must contain annotations, stating the expected result(s) of the respective test.
The test suite compiles and checks them against the given expectations.

For example: ``./test/libsolidity/syntaxTests/double_stateVariable_declaration.sol``

.. code-block:: solidity

    contract test {
        uint256 variable;
        uint128 variable;
    }
    // ----
    // DeclarationError: (36-52): Identifier already declared.

A syntax test must contain at least the contract under test itself, followed by the separator ``// ----``. The comments that follow the separator are used to describe the
expected compiler errors or warnings. The number range denotes the location in the source where the error occurred.
If you want the contract to compile without any errors or warning you can leave
out the separator and the comments that follow it.

In the above example, the state variable ``variable`` was declared twice, which is not allowed. This results in a ``DeclarationError`` stating that the identifier was already declared.

The ``isoltest`` tool is used for these tests and you can find it under ``./build/test/tools/``. It is an interactive tool which allows
editing of failing contracts using your preferred text editor. Let's try to break this test by removing the second declaration of ``variable``:

.. code-block:: solidity

    contract test {
        uint256 variable;
    }
    // ----
    // DeclarationError: (36-52): Identifier already declared.

Running ``./build/test/isoltest`` again results in a test failure:

.. code-block:: text

    syntaxTests/double_stateVariable_declaration.sol: FAIL
        Contract:
            contract test {
                uint256 variable;
            }

        Expected result:
            DeclarationError: (36-52): Identifier already declared.
        Obtained result:
            Success


``isoltest`` prints the expected result next to the obtained result, and also
provides a way to edit, update or skip the current contract file, or quit the application.

It offers several options for failing tests:

- ``edit``: ``isoltest`` tries to open the contract in an editor so you can adjust it. It either uses the editor given on the command line (as ``isoltest --editor /path/to/editor``), in the environment variable ``EDITOR`` or just ``/usr/bin/editor`` (in that order).
- ``update``: Updates the expectations for contract under test. This updates the annotations by removing unmet expectations and adding missing expectations. The test is then run again.
- ``skip``: Skips the execution of this particular test.
- ``quit``: Quits ``isoltest``.

All of these options apply to the current contract, expect ``quit`` which stops the entire testing process.

Automatically updating the test above changes it to

.. code-block:: solidity

    contract test {
        uint256 variable;
    }
    // ----

and re-run the test. It now passes again:

.. code-block:: text

    Re-running test case...
    syntaxTests/double_stateVariable_declaration.sol: OK


.. note::

    Choose a name for the contract file that explains what it tests, e.g. ``double_variable_declaration.sol``.
    Do not put more than one contract into a single file, unless you are testing inheritance or cross-contract calls.
    Each file should test one aspect of your new feature.


Running the Fuzzer via AFL
==========================

Fuzzing is a technique that runs programs on more or less random inputs to find exceptional execution
states (segmentation faults, exceptions, etc). Modern fuzzers are clever and run a directed search
inside the input. We have a specialized binary called ``solfuzzer`` which takes source code as input
and fails whenever it encounters an internal compiler error, segmentation fault or similar, but
does not fail if e.g., the code contains an error. This way, fuzzing tools can find internal problems in the compiler.

We mainly use `AFL <https://lcamtuf.coredump.cx/afl/>`_ for fuzzing. You need to download and
install the AFL packages from your repositories (afl, afl-clang) or build them manually.
Next, build Solidity (or just the ``solfuzzer`` binary) with AFL as your compiler:

.. code-block:: bash

    cd build
    # if needed
    make clean
    cmake .. -DCMAKE_C_COMPILER=path/to/afl-gcc -DCMAKE_CXX_COMPILER=path/to/afl-g++
    make solfuzzer

At this stage you should be able to see a message similar to the following:

.. code-block:: text

    Scanning dependencies of target solfuzzer
    [ 98%] Building CXX object test/tools/CMakeFiles/solfuzzer.dir/fuzzer.cpp.o
    afl-cc 2.52b by <lcamtuf@google.com>
    afl-as 2.52b by <lcamtuf@google.com>
    [+] Instrumented 1949 locations (64-bit, non-hardened mode, ratio 100%).
    [100%] Linking CXX executable solfuzzer

If the instrumentation messages did not appear, try switching the cmake flags pointing to AFL's clang binaries:

.. code-block:: bash

    # if previously failed
    make clean
    cmake .. -DCMAKE_C_COMPILER=path/to/afl-clang -DCMAKE_CXX_COMPILER=path/to/afl-clang++
    make solfuzzer

Otherwise, upon execution the fuzzer halts with an error saying binary is not instrumented:

.. code-block:: text

    afl-fuzz 2.52b by <lcamtuf@google.com>
    ... (truncated messages)
    [*] Validating target binary...

    [-] Looks like the target binary is not instrumented! The fuzzer depends on
        compile-time instrumentation to isolate interesting test cases while
        mutating the input data. For more information, and for tips on how to
        instrument binaries, please see /usr/share/doc/afl-doc/docs/README.

        When source code is not available, you may be able to leverage QEMU
        mode support. Consult the README for tips on how to enable this.
        (It is also possible to use afl-fuzz as a traditional, "dumb" fuzzer.
        For that, you can use the -n option - but expect much worse results.)

    [-] PROGRAM ABORT : No instrumentation detected
             Location : check_binary(), afl-fuzz.c:6920


Next, you need some example source files. This makes it much easier for the fuzzer
to find errors. You can either copy some files from the syntax tests or extract test files
from the documentation or the other tests:

.. code-block:: bash

    mkdir /tmp/test_cases
    cd /tmp/test_cases
    # extract from tests:
    path/to/solidity/scripts/isolate_tests.py path/to/solidity/test/libsolidity/SolidityEndToEndTest.cpp
    # extract from documentation:
    path/to/solidity/scripts/isolate_tests.py path/to/solidity/docs docs

The AFL documentation states that the corpus (the initial input files) should not be
too large. The files themselves should not be larger than 1 kB and there should be
at most one input file per functionality, so better start with a small number of.
There is also a tool called ``afl-cmin`` that can trim input files
that result in similar behaviour of the binary.

Now run the fuzzer (the ``-m`` extends the size of memory to 60 MB):

.. code-block:: bash

    afl-fuzz -m 60 -i /tmp/test_cases -o /tmp/fuzzer_reports -- /path/to/solfuzzer

The fuzzer creates source files that lead to failures in ``/tmp/fuzzer_reports``.
Often it finds many similar source files that produce the same error. You can
use the tool ``scripts/uniqueErrors.sh`` to filter out the unique errors.

Whiskers
========

*Whiskers* is a string templating system similar to `Mustache <https://mustache.github.io>`_. It is used by the
compiler in various places to aid readability, and thus maintainability and verifiability, of the code.

The syntax comes with a substantial difference to Mustache. The template markers ``{{`` and ``}}`` are
replaced by ``<`` and ``>`` in order to aid parsing and avoid conflicts with :ref:`yul`
(The symbols ``<`` and ``>`` are invalid in inline assembly, while ``{`` and ``}`` are used to delimit blocks).
Another limitation is that lists are only resolved one depth and they do not recurse. This may change in the future.

A rough specification is the following:

Any occurrence of ``<name>`` is replaced by the string-value of the supplied variable ``name`` without any
escaping and without iterated replacements. An area can be delimited by ``<#name>...</name>``. It is replaced
by as many concatenations of its contents as there were sets of variables supplied to the template system,
each time replacing any ``<inner>`` items by their respective value. Top-level variables can also be used
inside such areas.

There are also conditionals of the form ``<?name>...<!name>...</name>``, where template replacements
continue recursively either in the first or the second segment depending on the value of the boolean
parameter ``name``. If ``<?+name>...<!+name>...</+name>`` is used, then the check is whether
the string parameter ``name`` is non-empty.

.. _documentation-style:

Documentation Style Guide
=========================

In the following section you find style recommendations specifically focusing on documentation
contributions to Solidity.

English Language
----------------

Use English, with British English spelling preferred, unless using project or brand names. Try to reduce the usage of
local slang and references, making your language as clear to all readers as possible. Below are some references to help:

* `Simplified technical English <https://en.wikipedia.org/wiki/Simplified_Technical_English>`_
* `International English <https://en.wikipedia.org/wiki/International_English>`_
* `British English spelling <https://en.oxforddictionaries.com/spelling/british-and-spelling>`_


.. note::

    While the official Solidity documentation is written in English, there are community contributed :ref:`translations`
    in other languages available. Please refer to the `translation guide <https://github.com/solidity-docs/translation-guide>`_
    for information on how to contribute to the community translations.

Title Case for Headings
-----------------------

Use `title case <https://titlecase.com>`_ for headings. This means capitalise all principal words in
titles, but not articles, conjunctions, and prepositions unless they start the
title.

For example, the following are all correct:

* Title Case for Headings.
* For Headings Use Title Case.
* Local and State Variable Names.
* Order of Layout.

Expand Contractions
-------------------

Use expanded contractions for words, for example:

* "Do not" instead of "Don't".
* "Can not" instead of "Can't".

Active and Passive Voice
------------------------

Active voice is typically recommended for tutorial style documentation as it
helps the reader understand who or what is performing a task. However, as the
Solidity documentation is a mixture of tutorials and reference content, passive
voice is sometimes more applicable.

As a summary:

* Use passive voice for technical reference, for example language definition and internals of the Ethereum VM.
* Use active voice when describing recommendations on how to apply an aspect of Solidity.

For example, the below is in passive voice as it specifies an aspect of Solidity:

  Functions can be declared ``pure`` in which case they promise not to read
  from or modify the state.

For example, the below is in active voice as it discusses an application of Solidity:

  When invoking the compiler, you can specify how to discover the first element
  of a path, and also path prefix remappings.

Common Terms
------------

* "Function parameters" and "return variables", not input and output parameters.

Code Examples
-------------

A CI process tests all code block formatted code examples that begin with ``pragma solidity``, ``contract``, ``library``
or ``interface`` using the ``./test/cmdlineTests.sh`` script when you create a PR. If you are adding new code examples,
ensure they work and pass tests before creating the PR.

Ensure that all code examples begin with a ``pragma`` version that spans the largest where the contract code is valid.
For example ``pragma solidity >=0.4.0 <0.9.0;``.

Running Documentation Tests
---------------------------

Make sure your contributions pass our documentation tests by running ``./scripts/docs.sh`` that installs dependencies
needed for documentation and checks for any problems such as broken links or syntax issues.

Solidity Language Design
========================

To actively get involved in the language design process and share your ideas concerning the future of Solidity,
please join the `Solidity forum <https://forum.soliditylang.org/>`_.

The Solidity forum serves as the place to propose and discuss new language features and their implementation in
the early stages of ideation or modifications of existing features.

As soon as proposals get more tangible, their
implementation will also be discussed in the `Solidity GitHub repository <https://github.com/ethereum/solidity>`_
in the form of issues.

In addition to the forum and issue discussions, we regularly host language design discussion calls in which selected
topics, issues or feature implementations are debated in detail. The invitation to those calls is shared via the forum.

We are also sharing feedback surveys and other content that is relevant to language design in the forum.

If you want to know where the team is standing in terms or implementing new features, you can follow the implementation status in the `Solidity Github project <https://github.com/ethereum/solidity/projects/43>`_.
Issues in the design backlog need further specification and will either be discussed in a language design call or in a regular team call. You can
see the upcoming changes for the next breaking release by changing from the default branch (`develop`) to the `breaking branch <https://github.com/ethereum/solidity/tree/breaking>`_.

For ad-hoc cases and questions you can reach out to us via the `Solidity-dev Gitter channel <https://gitter.im/ethereum/solidity-dev>`_, a
dedicated chatroom for conversations around the Solidity compiler and language development.

We are happy to hear your thoughts on how we can improve the language design process to be even more collaborative and transparent.
