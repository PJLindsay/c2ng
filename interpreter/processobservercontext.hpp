/**
  *  \file interpreter/processobservercontext.hpp
  *  \brief Class interpreter::ProcessObserverContext
  */
#ifndef C2NG_INTERPRETER_PROCESSOBSERVERCONTEXT_HPP
#define C2NG_INTERPRETER_PROCESSOBSERVERCONTEXT_HPP

#include "interpreter/singlecontext.hpp"
#include "afl/base/ref.hpp"
#include "afl/base/signalconnection.hpp"
#include "afl/base/refcounted.hpp"

namespace interpreter {

    class Process;

    /** Context for observing another process.
        As long as the other process does not execute, this context provides access to its current namespace
        (current context stack, frames, etc.)
        If the other process continues execution or dies, the association is removed. */
    class ProcessObserverContext : public SingleContext {
     public:
        /** Construct ProcessObserverContext.
            \param p Process to observe */
        static ProcessObserverContext* create(Process& p);

        // Context:
        virtual Context* lookup(const afl::data::NameQuery& name, PropertyIndex_t& result);
        virtual void set(PropertyIndex_t index, afl::data::Value* value);
        virtual afl::data::Value* get(PropertyIndex_t index);
        virtual ProcessObserverContext* clone() const;
        virtual game::map::Object* getObject();
        virtual void enumProperties(PropertyAcceptor& acceptor);

        // BaseValue:
        virtual String_t toString(bool readable) const;
        virtual void store(TagNode& out, afl::io::DataSink& aux, afl::charset::Charset& cs, SaveContext& ctx) const;

     private:
        class State;

        ProcessObserverContext(afl::base::Ref<State> state);

        afl::base::Ref<State> m_state;
    };

}

#endif
