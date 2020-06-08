import unittest
import requests
import sys

class PubsubGetTopicsTest (unittest.TestCase):
    def runTest(self):
        r = requests.get("http://localhost:8042/v1/projects/interlok-test/topics")
        self.assertTrue (r.status_code==200, 'HTTP status code not 200')

def suite():
    suite = unittest.TestSuite()
    suite.addTest (PubsubGetTopicsTest())
    return suite

if __name__ == '__main__':
    
    print ("Test Runner: Docker Google PubSub emulator")

    runner = unittest.TextTestRunner(verbosity=2)
    test_suite = suite()
    result = runner.run (test_suite)
    
    if result.wasSuccessful():
        sys.exit(0)
    else:
        sys.exit(1)
