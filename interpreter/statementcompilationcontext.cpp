/**
  *  \file interpreter/statementcompilationcontext.cpp
  */

#include "interpreter/statementcompilationcontext.hpp"
#include "interpreter/error.hpp"

/**************************** Inline Functions ***************************/

// Constructor.
interpreter::StatementCompilationContext::StatementCompilationContext(World& world)
    : CompilationContext(world),
      m_parent(0),
      m_contextProvider(0)
{ }

// Construct child context.
interpreter::StatementCompilationContext::StatementCompilationContext(const StatementCompilationContext& parent)
    : CompilationContext(parent),
      m_parent(&parent),
      m_contextProvider(parent.m_contextProvider)
{ }

// Add a flag.
interpreter::StatementCompilationContext&
interpreter::StatementCompilationContext::withFlag(Flag flag)
{
    // ex IntStatementCompilationContext::withFlags
    CompilationContext::withFlag(flag);
    return *this;
}

// Remove a flag.
interpreter::StatementCompilationContext&
interpreter::StatementCompilationContext::withoutFlag(Flag flag)
{
    // ex IntStatementCompilationContext::withoutFlags
    CompilationContext::withoutFlag(flag);
    return *this;
}

// Set context provider.
interpreter::StatementCompilationContext&
interpreter::StatementCompilationContext::withContextProvider(ContextProvider* cp)
{
    // ex IntStatementCompilationContext::withExecutionContext
    m_contextProvider = cp;
    return *this;
}

// Set flags for one-line statement syntax.
interpreter::StatementCompilationContext&
interpreter::StatementCompilationContext::setOneLineSyntax()
{
    // ex IntStatementCompilationContext::setOneLineSyntax
    return withFlag(RefuseBlocks).withFlag(ExpressionsAreStatements).withoutFlag(WantTerminators);
}

// Set flags for block statement syntax.
interpreter::StatementCompilationContext&
interpreter::StatementCompilationContext::setBlockSyntax()
{
    // ex IntStatementCompilationContext::setBlockSyntax
    return withoutFlag(RefuseBlocks).withFlag(WantTerminators).withFlag(ExpressionsAreStatements);
}

// Get context provider.
interpreter::ContextProvider*
interpreter::StatementCompilationContext::getContextProvider() const
{
    // ex IntStatementCompilationContext::getExecutionContext
    return m_contextProvider;
}

// Generate code for "Break" statement.
void
interpreter::StatementCompilationContext::defaultCompileBreak(BytecodeObject& bco) const
{
    // ex IntStatementCompilationContext::compileBreak
    if (m_parent != 0) {
        m_parent->compileBreak(bco);
    } else {
        throw Error::misplacedKeyword("Break");
    }
}

// Generate code for "Continue" statement.
void
interpreter::StatementCompilationContext::defaultCompileContinue(BytecodeObject& bco) const
{
    // ex IntStatementCompilationContext::compileContinue
    if (m_parent != 0) {
        m_parent->compileContinue(bco);
    } else {
        throw Error::misplacedKeyword("Continue");
    }
}

// Generate code to clean up the stack for a "Return" statement.
void
interpreter::StatementCompilationContext::defaultCompileCleanup(BytecodeObject& bco) const
{
    // ex IntStatementCompilationContext::compileCleanup
    if (m_parent != 0) {
        m_parent->compileCleanup(bco);
    }
}
