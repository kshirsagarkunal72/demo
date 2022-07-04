package com.app.test;

import org.junit.jupiter.api.Test;

import com.app.main.OddEven;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class TestMain {
@Test
public void testInputIsEven(){
assertTrue(OddEven.checkIfInputIsAnEvenNumber(23)); //Assertion
}
}
