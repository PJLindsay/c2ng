/**
  *  \file server/common/session.hpp
  *  \brief Class server::common::Session
  */
#ifndef C2NG_SERVER_COMMON_SESSION_HPP
#define C2NG_SERVER_COMMON_SESSION_HPP

#include "afl/string/string.hpp"
#include "interpreter/arguments.hpp"
#include "afl/sys/log.hpp"

namespace server { namespace common {

    /** A connection's session state.
        Represents per-connection state that is lost when the connection is closed.
        This class contains the common state for most connections: a user identifier.

        <b>User vs. Admin</b>: a connection is in one of two states.
        It starts in "admin context" where access checking is disabled.
        Some commands only operate in admin context.
        It can be put in "user context" where access checks are in place for the given user.
        Some commands require user context to verify their permissions and determine the originator of an action. */
    class Session {
     public:
        /** Constructor. */
        Session();

        /** Destructor. */
        ~Session();

        /** Set the user.
            \param user User Id (empty for admin) */
        void setUser(String_t user);

        /** Get current user.
            \return User Id */
        String_t getUser() const;

        /** Check for admin permissions.
            \retval true Admin permissions present (access control disabled)
            \retval false User permissions (access control enabled) / user context */
        bool isAdmin() const;

        /** Check for admin permissions.
            \throw std::runtime_error if session does not have admin permissions */
        void checkAdmin() const;

        /** Check for user context.
            \throw std::runtime_error if session does not have a user context */
        void checkUser() const;

        /** Log a command.
            This function is part of Session because it includes session information (user name) in the message.
            \param log Logger to write to
            \param logChannel Log channel base name
            \param verb Command verb
            \param args Remaining arguments
            \param censor Argument position to censor (0-based) */
        void logCommand(afl::sys::LogListener& log, String_t logChannel, const String_t& verb, interpreter::Arguments args, size_t censor);


        /** Format a word for logging.
            This replaces complicated words by a placeholder so that users cannot spoof log entries.
            This function is used internally by logCommand(), and exported for convenience.
            \param word Word to format
            \param censor true if this word shall be censored (password)
            \return formatted log */
        static String_t formatWord(const String_t& word, bool censor);

     private:
        String_t m_user;
    };

} }

#endif
