# /// script
# dependencies = [
#   "tree-sitter",
#   "tree-sitter-bash",
# ]
# ///

# run with uv run bash-history-merger.py

# This script compares the bash history against the saved useful bash
# history, and adds all new commands or commands variations to the
# later one. After running it, the diff can be reviewed manually with
# magit to decide which commands should be actually added and which
# should be ignored, and the new commands can be further
# reviewed. Then we can delete the history

# The saved history must follow this convention: every part of a
# command which is variable (i.e., a parameter) must be in upper case.

# TODO: Some history is useful to save short-term, even if we don't
# want to do it long-term. Should we have a third file for it? Or
# don't remove the history after running the script and having to
# review some of the commands again next time?

import tree_sitter_bash as tsbash
from tree_sitter import Language, Parser

BASH_LANGUAGE = Language(tsbash.language())

parser = Parser(BASH_LANGUAGE)

USEFUL_HISTORY = "/home/ignacio/.me/bash_useful_history"
HISTORY = "/home/ignacio/.bash_history"

with open(USEFUL_HISTORY) as f:
    useful = f.readlines()

with open(HISTORY) as f:
    # TODO: Consider multiline commands? With the bash parser it
    # should be easy, although for simplicity I prefer for now to have
    # only single line commands
    new = f.readlines()

def equivalent(tree1, tree2):
    if tree1.type != tree2.type:
        return False

    if tree1.type == "command_name" and tree1.text != tree2.text:
        return False

    if tree1.type == "word":
        text = tree1.text.decode()
        if text.upper() != text and text != tree2.text.decode():
            return False

    children1 = tree1.children
    children2 = tree2.children
    if len(children1) != len(children2):
        return False

    # TODO: Allow some permutations. Use useful commands conventions
    # to know what is an argument (they all should be in capital
    # letters in my useful history)
    return all(equivalent(child1, child2) for child1,child2 in zip(children1, children2))

# easier to remove comments here than considering them later
useful_parsed = [parser.parse(bytes(line.split("#")[0], "utf8")) for line in useful]

for line in new:
    parsed = parser.parse(bytes(line, "utf8"))
    for u in useful_parsed:
        if equivalent(u.root_node, parsed.root_node):
            break
    else:
        # TODO: Name new parameters. Have some rules for using known
        # names: PATH, UUID, IP, TIMESTAMP, etc
        useful.append(line)
        useful_parsed.append(parsed)

with open(USEFUL_HISTORY, "w") as f:
    useful.sort()
    f.writelines(useful)
