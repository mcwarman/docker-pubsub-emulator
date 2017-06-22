import unittest
import requests

class PubsubGetTopicsTest (unittest.TestCase):
    def runTest(self):
        r = requests.get("http://localhost:8042/v1/projects/interlok-test/topics")
        self.failUnless (r.status_code==200, 'HTTP status code not 200')

def suite():
    suite = unittest.TestSuite()
    suite.addTest (PubsubGetTopicsTest())
    return suite

if __name__ == '__main__':
    runner = unittest.TextTestRunner()
    test_suite = suite()
    runner.run (test_suite)
