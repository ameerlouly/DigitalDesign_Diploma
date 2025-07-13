var qlcDesignQuality = "100.0";
var overallQualityImpacted = "0";
var moduleQuality = {
  "alu_seq": {
    "Nomenclature Style": 100,
    "Rtl Design Style": 100.0,
    "Simulation": 100,
    "Implementation": 100.0,
    "Score": 100.0,
    "Error Count": 0,
    "Warning Count": 0,
    "Info Count": 4,
    "QualityImpacted": 0
  }
};
var fileQuality = {
  "0": {
    "Nomenclature Style": 100,
    "Rtl Design Style": 100.0,
    "Simulation": 100,
    "Implementation": 100.0,
    "Score": 100.0,
    "Error Count": 0,
    "Warning Count": 0,
    "Info Count": 4,
    "QualityImpacted": 0
  }
};
var categoryQuality = {
    "Implementation": 100.0,
    "Rtl Design Style": 100.0,
    "Nomenclature Style": 100.0,
    "Simulation": 100.0
};
var checksEnabledPercentage = {
  "Implementation": {
    "Enabled Checks": 21,
    "Disabled Checks": 148,
    "Percentage": 12
  },
  "Rtl Design Style": {
    "Enabled Checks": 66,
    "Disabled Checks": 193,
    "Percentage": 25
  },
  "Nomenclature Style": {
    "Enabled Checks": 3,
    "Disabled Checks": 43,
    "Percentage": 6
  },
  "Simulation": {
    "Enabled Checks": 10,
    "Disabled Checks": 36,
    "Percentage": 21
  }
};
var masterCategoryMap = {
    "Nomenclature Style": [
        "Nomenclature Style"
    ],
    "Rtl Design Style": [
        "Rtl Design Style"
    ],
    "Simulation": [
        "Simulation",
        "Testbench"
    ],
    "Implementation": [
        "Synthesis",
        "Connectivity",
        "Clock",
        "Reset"
    ]
};
