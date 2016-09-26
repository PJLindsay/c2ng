/**
  *  \file u/t_game.hpp
  *  \brief Tests for game
  */
#ifndef C2NG_U_T_GAME_HPP
#define C2NG_U_T_GAME_HPP

#include <cxxtest/TestSuite.h>

class TestGameCargoSpec : public CxxTest::TestSuite {
 public:
    void testParse();
    void testParseError();
    void testAdd();
    void testSubtract();
    void testMult();
    void testCompare();
    void testMixedCompare();
    void testDivide1();
    void testDivide2();
    void testToString();
};

class TestGameElement : public CxxTest::TestSuite {
 public:
    void testOperator();
    void testTorpedo();
};

class TestGameException : public CxxTest::TestSuite {
 public:
    void testIt();
};

class TestGameExperienceLevelSet : public CxxTest::TestSuite {
 public:
    void testPreconditions();
    void testFormat();
};

class TestGameExtraContainer : public CxxTest::TestSuite {
 public:
    void testIt();
};

class TestGameExtraIdentifier : public CxxTest::TestSuite {
 public:
    void testIt();
};

class TestGameGame : public CxxTest::TestSuite {
 public:
    void testRef();
};

class TestGameHistoryTurn : public CxxTest::TestSuite {
 public:
    void testSet();
    void testSuccess();
    void testFail();
};

class TestGameHistoryTurnList : public CxxTest::TestSuite {
 public:
    void testIt();
    void testGap();
};

class TestGameHostVersion : public CxxTest::TestSuite {
 public:
    void testFormat();
    void testAccessor();
    void testVersion();
};

class TestGameInterpreterInterface : public CxxTest::TestSuite {
 public:
    void testIt();
};

class TestGamePlayer : public CxxTest::TestSuite {
 public:
    void testSet();
    void testInit();
    void testChange();
    void testOriginal();
};

class TestGamePlayerArray : public CxxTest::TestSuite {
 public:
    void testArray();
};

class TestGamePlayerBitMatrix : public CxxTest::TestSuite {
 public:
    void testMatrix();
};

class TestGameRegistrationKey : public CxxTest::TestSuite {
 public:
    void testIt();
};

class TestGameSpecificationLoader : public CxxTest::TestSuite {
 public:
    void testIt();
};

class TestGameStringVerifier : public CxxTest::TestSuite {
 public:
    void testIt();
};

class TestGameTeamSettings : public CxxTest::TestSuite {
 public:
    void testInit();
    void testSet();
    void testModify();
    void testViewpoint();
};

class TestGameTimestamp : public CxxTest::TestSuite {
 public:
    void testInit();
    void testRelation();
};

class TestGameTurnLoader : public CxxTest::TestSuite {
 public:
    void testInterface();
    void testDefault();
};

class TestGameTypes : public CxxTest::TestSuite {
 public:
    void testNativeRace();
    void testShipyardAction();
    void testPlanetaryBuilding();
    void testIntegerProperty();
    void testLongProperty();
    void testNegativeProperty();
    void testStringProperty();
};

class TestGameUnitScoreDefinitionList : public CxxTest::TestSuite {
 public:
    void testIt();
};

class TestGameUnitScoreList : public CxxTest::TestSuite {
 public:
    void testIt();
};

#endif