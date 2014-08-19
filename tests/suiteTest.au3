#Region include for test
#include <../micro.au3>
#EndRegion

#Region Test suite definition
Local $testSuite = _testSuite_("Test Suite Test")

If $CmdLine[0] > 0 Then
    $testSuite.ci = True
EndIf

$testSuite.addTest(assertTruePass())
$testSuite.addTest(assertFalsePass())
$testSuite.addTest(assertEqualsPass())
$testSuite.addTest(assertNotEqualsPass())
$testSuite.addTest(assertTrueFail())
$testSuite.addTest(assertFalseFail())
$testSuite.addTest(assertEqualsFail())
$testSuite.addTest(assertNotEqualsFail())

$testSuite.finish()
#EndRegion

#Region Test Functions
Func assertTruePass()
    $test = _test_("assertTrue Passes")
	$test.assertTrue("True", True)
    Return $test
EndFunc

Func assertFalsePass()
    $test = _test_("assertFalse Passes")
	$test.assertFalse("False", False)
    Return $test
EndFunc

Func assertEqualsPass()
    $test = _test_("assertEquals Passes")
	$test.assertEquals("1, 1", 1, 1)
	$test.assertEquals('"a", "a"', "a", "a")
	$test.assertEquals("-13, -13", -13, -13)
	$test.assertEquals('"-13", "-13"', "-13", "-13")
	$test.assertEquals('True, True', True, True)
	$test.assertEquals('False, False', False, False)
    Return $test
EndFunc

Func assertNotEqualsPass()
    $test = _test_("assertNotEquals Passes")
	$test.assertNotEquals("1, 2", 1, 2)
	$test.assertNotEquals('"a", "b"', "a", "b")
	$test.assertNotEquals("-13, 13", -13, 13)
	$test.assertNotEquals('"13", "-13"', "13", "-13")
	$test.assertNotEquals('True, False', True, False)
	$test.assertNotEquals('False, True', False, True)
    Return $test
EndFunc

Func assertTrueFail()
    $test = _test_("assertTrue Fails")
	$test.assertTrue("False", False)
    Return $test
EndFunc

Func assertFalseFail()
    $test = _test_("assertFalse Fails")
	$test.assertFalse("True", True)
    Return $test
EndFunc

Func assertEqualsFail()
    $test = _test_("assertEquals Fails")
	$test.assertEquals("1, 2", 1, 2)
	$test.assertEquals('"a", "b"', "a", "b")
	$test.assertEquals("-13, 13", -13, 13)
	$test.assertEquals('"13", "-13"', "13", "-13")
	$test.assertEquals('True, False', True, False)
	$test.assertEquals('False, True', False, True)
    Return $test
EndFunc

Func assertNotEqualsFail()
    $test = _test_("assertNotEquals Fails")
	$test.assertNotEquals("1, 1", 1, 1)
	$test.assertNotEquals('"a", "a"', "a", "a")
	$test.assertNotEquals("-13, -13", -13, -13)
	$test.assertNotEquals('"-13", "-13"', "-13", "-13")
	$test.assertNotEquals('True, True', True, True)
	$test.assertNotEquals('False, False', False, False)
    Return $test
EndFunc
#EndRegion
