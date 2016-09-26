/**
  *  \file interpreter/error.cpp
  */

#include "interpreter/error.hpp"
#include "afl/string/format.hpp"

interpreter::Error::Error(const char* error)
    : m_error(error),
      m_trace()
{
    // ex IntError::IntError
}

interpreter::Error::Error(String_t error)
    : m_error(error),
      m_trace()
{
    // ex IntError::IntError
}

interpreter::Error::~Error() throw()
{ }

const char*
interpreter::Error::what() const throw()
{
    return m_error.c_str();
}

void
interpreter::Error::addTrace(String_t line)
{
    if (!m_trace.empty()) {
        m_trace += '\n';
    }
    m_trace += line;
}

// /** Generate an "unknown identifier" error for a given identifier. */
interpreter::Error
interpreter::Error::unknownIdentifier(const String_t& name)
{
    return Error("Unknown identifier, " + name);
}

// /** Generate a "type mismatch" error. */
interpreter::Error
interpreter::Error::typeError(ExpectedType expectedType)
{
    static const char*const suffix[] = {
        "",
        ", expecting integer",
        ", expecting bool",
        ", expecting number",
        ", expecting number or string",
        ", expecting string",
        ", expecting list or function",
        ", expecting list",
        ", expecting record",
        ", expecting function or subroutine",
        ", expecting subroutine",
        ", expecting keymap",
        ", expecting data block",
        ", expecting file number",
        ", expecting array",
    };
    return Error(String_t("Type error") + suffix[expectedType]);
}

// /** Generate an internal error. */
interpreter::Error
interpreter::Error::internalError(const char* msg)
{
    return Error(String_t("Internal error: ") + msg);
}

// /** Generate an "object not serializable" error. This error is
//     generated when an object incapable of serializing is asked to
//     serialize (IntValue::store), which normally only happens when a
//     process suspends. */
interpreter::Error
interpreter::Error::notSerializable()
{
    return Error("Not suspendable");
}

// /** Generate a "not assignable" error. This error is generated when an
//     assignment is attempted to a value which is not assignable
//     (usually, a read-only property). */
interpreter::Error
interpreter::Error::notAssignable()
{
    return Error("Attempt to assign read-only value");
}

// /** Generate a range error. */
interpreter::Error
interpreter::Error::rangeError()
{
    return Error("Range error");
}

// /** Generate a "multi-line not allowed" error. */
interpreter::Error
interpreter::Error::invalidMultiline()
{
    return Error("Multi-line statement not allowed here");
}

// /** Generate a "expecting keyword" error, one permitted keyword. */
interpreter::Error
interpreter::Error::expectKeyword(const char* kw)
{
    return Error(afl::string::Format("Expecting \"%s\"", kw));
}

// /** Generate a "expecting keyword" error, two permitted keywords. */
interpreter::Error
interpreter::Error::expectKeyword(const char* kw1, const char* kw2)
{
    return Error(afl::string::Format("Expecting \"%s\" or \"%s\"", kw1, kw2));
}

// /** Generate a "expecting symbol" error, one permitted keyword. */
interpreter::Error
interpreter::Error::expectSymbol(const char* sym)
{
    return expectKeyword(sym);
}

// /** Generate a "expecting symbol" error, two permitted keywords. */
interpreter::Error
interpreter::Error::expectSymbol(const char* sym1, const char* sym2)
{
    return expectKeyword(sym1, sym2);
}

// /** Generate a "keyword not expected here" error. */
interpreter::Error
interpreter::Error::misplacedKeyword(const char* kw)
{
    return Error(afl::string::Format("\"%s\" not allowed here", kw));
}

// /** Generate an "expecting end of line" error. */
interpreter::Error
interpreter::Error::garbageAtEnd(bool expression)
{
    return Error(expression
                 ? "Expression incorrectly terminated (missing operator?)"
                 : "Expecting end of line");
}

// /** Generate an "expecting identifier" error.
//     \param what What the identifier will name */
interpreter::Error
interpreter::Error::expectIdentifier(const char* what)
{
    return Error(afl::string::Format("Expecting identifier, %s", what));
}

// /** Generate a "command not valid in this context" error. */
interpreter::Error
interpreter::Error::contextError()
{
    return Error("Command not valid in this context");
}