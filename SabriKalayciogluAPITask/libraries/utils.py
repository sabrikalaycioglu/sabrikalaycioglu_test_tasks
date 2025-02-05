import string
import sys
import datetime
import time
import os
import base64
import csv
import json
import uuid
import dicttoxml

def remove_empty_elements(d):
    """Recursively removes empty lists, empty dicts, or None elements from a dictionary.
    """
    def empty(x):
        return x is None or x == {} or x == []
    if not isinstance(d, (dict, list)):
        return d
    elif isinstance(d, list):
        return [v for v in (remove_empty_elements(v) for v in d) if not empty(v)]
    else:
        return {k: v for k, v in ((k, remove_empty_elements(v)) for k, v in d.items()) if not empty(v)}
        
def base64auth(username, password):
    """Generates base64 hash based on username and password for HTTP header.
    """
    hashseed=username+":"+password
    hasheduserpass = base64.b64encode(hashseed.encode())
    return hasheduserpass

def getCSVDataByTestId(listCSVObj, testId):
    """Returns all the columns data in csv filter by test_id.
    Return :  A Dictionary variable
    """
    for csvObj in listCSVObj:
        if(testId == csvObj["TestCaseID"]):
            return csvObj
    return None

def getCSVDataByStepId(listCSVObj, stepId):
    """Returns all the columns data in csv filter by step_id.
    Return :  A Dictionary variable
    """
    for csvObj in listCSVObj:
        if(stepId == csvObj["TestStepID"]):
            return csvObj
    return None

def readcsvDataDict(pathCsv, sheetCsv):
    """Reads CSV data into dictionary from given pathCsv and sheetCsv.
    """
    dataList = []
    sheetPath = os.path.join(pathCsv, sheetCsv)
    with open(sheetPath,'r') as infile:
        csvObj = csv.DictReader(infile)
        for record in csvObj:
            dataList.append(record)
            print(record)
    return dataList

def generateUUID():
    """Generates UUID.
    """
    random_uuid = uuid.uuid1()
    return str(random_uuid)

def cleanXMLString(prettyXML):
    """Cleans \n characters from given XML file.
    """
    data1 = prettyXML.split('\n')
    data2 = []
    for x in data1:
        y = x.strip()
        if not y.startswith('<'):
            y=' ' + y
        if y: data2.append(y)
    data3 = ''.join(data2)
    return data3

def convertJsonToXML(jsonStr):
    # jsonFile = open("catalog.json", "r");  # will be replaced with argument instead of file
    if (jsonStr is None):
        return None
    data = json.loads(jsonStr)
    xmlMsg = dicttoxml.dicttoxml(data)
    return xmlMsg

if __name__ == '__main__':
    print("success")
