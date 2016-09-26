/**
  *  \file game/browser/filesystemfolder.cpp
  */

#include "game/browser/filesystemfolder.hpp"
#include "afl/io/directoryentry.hpp"
#include "afl/string/format.hpp"
#include "afl/string/string.hpp"
#include "game/browser/browser.hpp"

namespace {
    bool sortFolders(const game::browser::Folder& a, const game::browser::Folder& b)
    {
        return afl::string::strCaseCompare(a.getName(), b.getName()) < 0;
    }
}

game::browser::FileSystemFolder::FileSystemFolder(Browser& parent, afl::base::Ptr<afl::io::Directory> dir, String_t title)
    : m_parent(parent),
      m_directory(dir),
      m_title(title)
{ }

void
game::browser::FileSystemFolder::loadContent(afl::container::PtrVector<Folder>& result)
{
    using afl::base::Ptr;
    using afl::base::Enumerator;
    using afl::io::Directory;
    using afl::io::DirectoryEntry;

    // Enumerate directory
    Ptr<Enumerator<Ptr<DirectoryEntry> > > content = m_directory->getDirectoryEntries();
    if (content.get() == 0) {
        return;
    }

    // Build list
    Ptr<DirectoryEntry> elem;
    while (content->getNextElement(elem)) {
        if (elem.get() != 0
            && (elem->getFileType() == DirectoryEntry::tDirectory || elem->getFileType() == DirectoryEntry::tRoot)
            && !elem->getFlags().contains(DirectoryEntry::Hidden))
        {
            result.pushBackNew(new FileSystemFolder(m_parent, elem->openDirectory(), elem->getTitle()));
        }
    }

    // Sort
    result.sort(sortFolders);
}

afl::base::Ptr<game::Root>
game::browser::FileSystemFolder::loadGameRoot()
{
    return m_parent.loadGameRoot(m_directory);
}

String_t
game::browser::FileSystemFolder::getName() const
{
    return m_title;
}

util::rich::Text
game::browser::FileSystemFolder::getDescription() const
{
    if (!m_directory->getDirectoryName().empty()) {
        return m_parent.translator().translateString("File system folder");
    } else {
        return m_parent.translator().translateString("Virtual folder");
    }
}

bool
game::browser::FileSystemFolder::isSame(const Folder& other) const
{
    const FileSystemFolder* p = dynamic_cast<const FileSystemFolder*>(&other);
    return p != 0
        && !m_directory->getDirectoryName().empty()
        && p->m_directory->getDirectoryName() == m_directory->getDirectoryName();
}

bool
game::browser::FileSystemFolder::canEnter() const
{
    return true;
}

game::browser::Folder::Kind
game::browser::FileSystemFolder::getKind() const
{
    return kFolder;
}