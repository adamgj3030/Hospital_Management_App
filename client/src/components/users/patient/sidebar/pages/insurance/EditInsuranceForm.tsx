"use client";

import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import Label from "../../../../../ui/Label";
import Input from "../../../../../ui/Input";
//import Select from "../../../../../ui/select/Select";
import SelectItem from "../../../../../ui/select/SelectItem";
import Checkbox from "../../../../../ui/Checkbox";
import FormSubmitButton from "../../../../../ui/buttons/FormSubmitButton";

import { Heart, ArrowLeft, Edit2, ShieldPlus } from "lucide-react";
import DefaultButton from "../../../../../ui/buttons/DefaultButton";

import Select from "react-select";

import axios from "axios";

import envConfig from "../../../../../../envConfig";

const fetchInsuranceData = async () => {
  try {
    const token = localStorage.getItem("token");

    if (!token) {
      throw new Error("No token found");
    }
    // Fetch insurance information
    const response = await axios.get(
      `${envConfig.apiUrl}/auth/patient/insurance-info`,
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }
    );
    console.log("insur select result:", response.data);
    return response.data.data;
  } catch (error) {
    console.error("Error fetching insurance info:", error);
  }
};

export default function EditInsuranceForm() {
  const [formData, setFormData] = useState({
    providerName: "",
    policyNum: "",
    covDetails: "",
    covExpDate: "",
    // primaryInsurance: {
    //   provider: "",
    //   policyNumber: "",
    //   groupNumber: "",
    //   policyHolderName: "",
    //   policyHolderDOB: "",
    //   relationshipToPatient: "",
    //   coverageDetails: "",
    //   coverageExpirationDate: "",
    // },
    // secondaryInsurance: {
    //   hasSecondary: false,
    //   provider: "",
    //   policyNumber: "",
    //   groupNumber: "",
    //   policyHolderName: "",
    //   coverageDetails: "",
    //   coverageExpirationDate: "",
    // },
    // consentToVerify: false,
    // consentToBill: false,
    // emergencyContact: {
    //   name: "",
    //   relationship: "",
    //   phone: "",
    // },
  });

  const insuranceOptions = [
    {
      label: "Blue Cross Blue Shield",
      coverage: ["PPO", "HMO", "POS"],
      value: "Blue Cross Blue Shield",
    },
    { label: "Aetna", coverage: ["PPO", "HMO", "EPO", "POS"], value: "Atena" },
    { label: "Cigna", coverage: ["PPO", "HMO", "POS", "HDHP"], value: "Cigna" },
    {
      label: "UnitedHealthcare",
      coverage: ["PPO", "HMO", "POS", "HDHP"],
      value: "UnitedHealthcare",
    },
    { label: "Humana", coverage: ["PPO", "HMO", "POS"], value: "Humana" },
    {
      label: "Anthem",
      coverage: ["PPO", "HMO", "EPO", "Medicaid"],
      value: "Anthem",
    },
    {
      label: "Molina Healthcare",
      coverage: ["PPO", "HMO", "Medicaid"],
      value: "Molina Healthcare",
    },
  ];

  const [coverageOptions, setCoverageOptions] = useState<{ label: string }[]>(
    []
  );

  const [isEditing, setIsEditing] = useState(false);

  const [error, setError] = useState("");

  // useEffect(() => {
  //   const loadInsuranceData = async () => {
  //     const data = await fetchInsuranceData();
  //     setFormData(data);
  //   };
  //   loadInsuranceData();
  // }, []);

  const formatDateForInput = (dateString) => {
    if (!dateString) return ""; // Handle empty case
    const date = new Date(dateString);
    return date.toISOString().split("T")[0]; // Returns YYYY-MM-DD
  };

  useEffect(() => {
    const loadInsuranceData = async () => {
      let data = await fetchInsuranceData();

      data = data[0];
      console.log(`data: ${data[0]}`);
      if (data) {
        setFormData((prevData) => ({
          ...prevData,
          providerName: data.providerName || "",
          policyNum: data.policy_number || "",
          covDetails: data.coverageDetails || "",
          covExpDate: formatDateForInput(data.coverage_expiration_date) || "",
        }));
      }
    };
    if (!isEditing) {
      loadInsuranceData();
    }
  }, [!isEditing]);

  // const handleInputChange = (section, field, value) => {
  //   setFormData((prevData) => ({
  //     ...prevData,
  //     [section]: {
  //       ...prevData[section],
  //       [field]: value,
  //     },
  //   }));
  // };

  const handleChange = (e) => {
    //e is the event object
    const { name, value } = e.target; //Breaks down the element where changes took place into name and value (Destructuring input)
    setFormData((prevState) => ({
      ...prevState,
      [name]: value,
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    // Simulating form submission
    console.log("Submitting updated insurance data:", formData);
    // Here you would typically send the data to your backend
    //alert("Insurance information updated successfully!");
    setError("");

    try {
      const token = localStorage.getItem("token");

      if (!token) {
        throw new Error("No token found");
      }

      const response = await axios.put(
        `${envConfig.apiUrl}/auth/patient/update-insurance`,
        formData,
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );

      if (response.status === 200 && response.data) {
        console.log("Add Medical History Successful!");
      } else {
        setError("Add Medical History failed. Please try again.");
      }
    } catch (error) {
      if (
        error.response &&
        error.response.data &&
        error.response.data.message
      ) {
        setError(error.response.data.message);
      } else {
        setError("An error occurred. Please try again.");
      }
      console.error("Medical History error:", error);
    }
    setIsEditing(false);
  };

  useEffect(() => {
    if (formData.providerName) {
      // Find the selected provider and extract the coverage options
      const selectedProvider = insuranceOptions.find(
        (option) => option.label === formData.providerName
      );

      // Set the coverage options for the selected provider
      if (selectedProvider) {
        setCoverageOptions(
          selectedProvider.coverage.map((coverage) => ({
            label: coverage,
            value: coverage,
          }))
        );
      } else {
        // If no provider found, reset coverage options to empty
        setCoverageOptions([]);
      }
    } else {
      // If no provider is selected, reset coverage options to empty
      setCoverageOptions([]);
    }
  }, [formData.providerName]);

  return (
    <div className="flex flex-col min-h-screen bg-pink-50 shadow-2xl rounded-lg">
      <main className="flex-1 container mx-auto px-4 py-8">
        <div className="max-w-4xl mx-auto bg-white shadow-lg rounded-lg overflow-hidden">
          <div className="p-6 sm:p-10">
            <div className="flex justify-between items-center mb-6">
              <h1 className="text-3xl font-bold mb-6">Insurance Information</h1>
              <DefaultButton onClick={() => setIsEditing(!isEditing)}>
                {isEditing ? (
                  <>
                    <ArrowLeft className="h-4 w-4 mr-2" />
                    Cancel
                  </>
                ) : (
                  <>
                    <Edit2 className="h-4 w-4 mr-2" />
                    Edit
                  </>
                )}
              </DefaultButton>
            </div>
            <form onSubmit={handleSubmit} className="space-y-6">
              <div className="space-y-6">
                <h2 className="text-xl font-semibold flex items-center">
                  {" "}
                  <ShieldPlus className="h-5 w-5 mr-2 text-pink-500" />
                  Primary Insurance
                </h2>
                <div className="grid grid-cols-1  gap-4">
                  <div>
                    <Label htmlFor="insuranceProvider">
                      Insurance Provider
                    </Label>
                    {/* <Input
                      id="insuranceProvider"
                      name="providerName"
                      value={formData.providerName}
                      onChange={handleChange}
                      disabled={!isEditing}
                      required
                    /> */}
                    <Select
                      placeholder="Provider Name"
                      options={insuranceOptions}
                      isDisabled={!isEditing}
                      value={
                        // Find the selected option based on formData.covDetails (assuming it's a label)
                        insuranceOptions.find(
                          (option) => option.label === formData.providerName
                        ) || null
                      }
                      isClearable
                      onChange={(option) =>
                        setFormData({
                          ...formData,
                          providerName: option ? option.label : "", // Update provider name
                          // Reset coverage when provider changes
                        })
                      }
                    />
                  </div>
                  <div>
                    <Label htmlFor="policyNumber">Policy Number</Label>
                    <Input
                      id="policyNumber"
                      name="policyNum"
                      value={formData.policyNum}
                      onChange={handleChange}
                      maxLength={12}
                      disabled={!isEditing}
                      required
                    />
                  </div>
                  {/* <div>
                  <Label htmlFor="groupNumber">Group Number</Label>
                  <Input
                    id="groupNumber"
                    //value={formData.primaryInsurance.groupNumber}
                    onChange={(e) =>
                      handleInputChange(
                        "primaryInsurance",
                        "groupNumber",
                        e.target.value
                      )
                    }
                    disabled={!isEditing}
                  />
                </div> */}
                  {/* <div>
                  <Label htmlFor="policyHolderName">Policy Holder Name</Label>
                  <Input
                    id="policyHolderName"
                    //value={formData.primaryInsurance.policyHolderName}
                    onChange={(e) =>
                      handleInputChange(
                        "primaryInsurance",
                        "policyHolderName",
                        e.target.value
                      )
                    }
                    disabled={!isEditing}
                    required
                  />
                </div> */}
                  {/* <div>
                  <Label htmlFor="policyHolderDOB">
                    Policy Holder Date of Birth
                  </Label>
                  <Input
                    id="policyHolderDOB"
                    type="date"
                    //value={formData.primaryInsurance.policyHolderDOB}
                    onChange={(e) =>
                      handleInputChange(
                        "primaryInsurance",
                        "policyHolderDOB",
                        e.target.value
                      )
                    }
                    disabled={!isEditing}
                    required
                  />
                </div> */}
                  {/* <div>
                  <Label htmlFor="relationshipToPatient">
                    Relationship to Patient
                  </Label>
                  <Select
                    id="relationshipToPatient"
                    name="relationshipToPatient"
                    disabled={!isEditing}
                  >
                    <SelectItem value="">Select relationship</SelectItem>
                    <SelectItem value="self">Self</SelectItem>
                    <SelectItem value="spouse">Spouse</SelectItem>
                    <SelectItem value="child">Child</SelectItem>
                    <SelectItem value="other">Other</SelectItem>
                  </Select>
                </div> */}
                  <div>
                    <Label htmlFor="coverageDetails">Coverage Details</Label>
                    {/* <Input
                      id="coverageDetails"
                      name="covDetails"
                      placeholder="e.g., PPO, HMO, etc."
                      value={formData.covDetails}
                      onChange={handleChange}
                      disabled={!isEditing}
                      required
                    /> */}
                    <Select
                      options={coverageOptions}
                      isClearable
                      placeholder={"Coverage Plan"}
                      isDisabled={!isEditing}
                      value={
                        // Find the selected option based on formData.covDetails (assuming it's a label)
                        coverageOptions.find(
                          (option) => option.label === formData.covDetails
                        ) || null
                      }
                      onChange={(option) =>
                        option
                          ? setFormData({
                              ...formData,
                              covDetails: option ? option.label : "",
                            })
                          : null
                      }
                    />
                  </div>
                  <div>
                    <Label htmlFor="coverageExpirationDate">
                      Coverage Expiration Date
                    </Label>
                    <Input
                      id="coverageExpirationDate"
                      name="covExpDate"
                      type="date"
                      value={formData.covExpDate}
                      onChange={handleChange}
                      disabled={!isEditing}
                      required
                    />
                  </div>
                </div>
              </div>

              {/* <div className="space-y-4">
              <h2 className="text-xl font-semibold">Secondary Insurance</h2>
              <div>
                <Label>Do you have secondary insurance?</Label>
                <RadioGroup 
                  value={formData.secondaryInsurance.hasSecondary ? "yes" : "no"}
                  onValueChange={(value) => handleInputChange('secondaryInsurance', 'hasSecondary', value === "yes")}
                  disabled={!isEditing}
                >
                  <div className="flex items-center space-x-2">
                    <RadioGroupItem value="yes" id="secondary-yes" />
                    <Label htmlFor="secondary-yes">Yes</Label>
                  </div>
                  <div className="flex items-center space-x-2">
                    <RadioGroupItem value="no" id="secondary-no" />
                    <Label htmlFor="secondary-no">No</Label>
                  </div>
                </RadioGroup>
              </div>
              {formData.secondaryInsurance.hasSecondary && (
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div>
                    <Label htmlFor="secondaryProvider">Insurance Provider</Label>
                    <Input 
                      id="secondaryProvider" 
                      value={formData.secondaryInsurance.provider}
                      onChange={(e) => handleInputChange('secondaryInsurance', 'provider', e.target.value)}
                      disabled={!isEditing}
                    />
                  </div>
                  <div>
                    <Label htmlFor="secondaryPolicyNumber">Policy Number</Label>
                    <Input 
                      id="secondaryPolicyNumber" 
                      value={formData.secondaryInsurance.policyNumber}
                      onChange={(e) => handleInputChange('secondaryInsurance', 'policyNumber', e.target.value)}
                      disabled={!isEditing}
                    />
                  </div>
                  <div>
                    <Label htmlFor="secondaryGroupNumber">Group Number</Label>
                    <Input 
                      id="secondaryGroupNumber" 
                      value={formData.secondaryInsurance.groupNumber}
                      onChange={(e) => handleInputChange('secondaryInsurance', 'groupNumber', e.target.value)}
                      disabled={!isEditing}
                    />
                  </div>
                  <div>
                    <Label htmlFor="secondaryPolicyHolderName">Policy Holder Name</Label>
                    <Input 
                      id="secondaryPolicyHolderName" 
                      value={formData.secondaryInsurance.policyHolderName}
                      onChange={(e) => handleInputChange('secondaryInsurance', 'policyHolderName', e.target.value)}
                      disabled={!isEditing}
                    />
                  </div>
                  <div>
                    <Label htmlFor="secondaryCoverageDetails">Coverage Details</Label>
                    <Input 
                      id="secondaryCoverageDetails" 
                      placeholder="e.g., PPO, HMO, etc." 
                      value={formData.secondaryInsurance.coverageDetails}
                      onChange={(e) => handleInputChange('secondaryInsurance', 'coverageDetails', e.target.value)}
                      disabled={!isEditing}
                    />
                  </div>
                  <div>
                    <Label htmlFor="secondaryCoverageExpirationDate">Coverage Expiration Date</Label>
                    <Input 
                      id="secondaryCoverageExpirationDate" 
                      type="date" 
                      value={formData.secondaryInsurance.coverageExpirationDate}
                      onChange={(e) => handleInputChange('secondaryInsurance', 'coverageExpirationDate', e.target.value)}
                      disabled={!isEditing}
                    />
                  </div>
                </div>
              )}
            </div> */}

              {/* <div className="space-y-4">
              <h2 className="text-xl font-semibold">Additional Information</h2>
              <div className="space-y-2">
                <div className="flex items-center space-x-2">
                  <Checkbox
                    id="consentToVerify"
                    //checked={formData.consentToVerify}
                    onCheckedChange={(checked) =>
                      handleInputChange("consentToVerify", "", checked)
                    }
                    disabled={!isEditing}
                  />
                  <Label htmlFor="consentToVerify">
                    I consent to have my insurance eligibility verified
                  </Label>
                </div>
                <div className="flex items-center space-x-2">
                  <Checkbox
                    id="consentToBill"
                    //checked={formData.consentToBill}
                    onCheckedChange={(checked) =>
                      handleInputChange("consentToBill", "", checked)
                    }
                    disabled={!isEditing}
                  />
                  <Label htmlFor="consentToBill">
                    I consent to have my insurance billed for services rendered
                  </Label>
                </div>
              </div>
            </div> */}

              {/* <div className="space-y-4">
              <h2 className="text-xl font-semibold">Emergency Contact</h2>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                  <Label htmlFor="emergencyContactName">Name</Label>
                  <Input
                    id="emergencyContactName"
                    //value={formData.emergencyContact.name}
                    onChange={(e) =>
                      handleInputChange(
                        "emergencyContact",
                        "name",
                        e.target.value
                      )
                    }
                    disabled={!isEditing}
                    required
                  />
                </div>
                <div>
                  <Label htmlFor="emergencyContactRelationship">
                    Relationship
                  </Label>
                  <Input
                    id="emergencyContactRelationship"
                    //value={formData.emergencyContact.relationship}
                    onChange={(e) =>
                      handleInputChange(
                        "emergencyContact",
                        "relationship",
                        e.target.value
                      )
                    }
                    disabled={!isEditing}
                    required
                  />
                </div>
                <div>
                  <Label htmlFor="emergencyContactPhone">Phone Number</Label>
                  <Input
                    id="emergencyContactPhone"
                    type="tel"
                    //value={formData.emergencyContact.phone}
                    onChange={(e) =>
                      handleInputChange(
                        "emergencyContact",
                        "phone",
                        e.target.value
                      )
                    }
                    disabled={!isEditing}
                    required
                  />
                </div>
              </div>
            </div> */}

              <div className="flex justify-end space-x-4">
                {isEditing && (
                  <>
                    <DefaultButton
                      type="button"
                      variant="outline"
                      onClick={() => setIsEditing(false)}
                    >
                      Cancel
                    </DefaultButton>
                    <DefaultButton type="submit">
                      Update Insurance Information
                    </DefaultButton>
                  </>
                )}
              </div>
            </form>
          </div>
        </div>
      </main>
      {/* <footer className="bg-white border-t py-6 px-4 md:px-6">
        <div className="container mx-auto flex flex-col sm:flex-row items-center justify-between">
          <p className="text-xs text-gray-500">
            © 2024 WomenWell. All rights reserved.
          </p>
          <nav className="flex gap-4 sm:gap-6 mt-4 sm:mt-0">
            <Link className="text-xs hover:underline underline-offset-4" to="#">
              Privacy Policy
            </Link>
            <Link className="text-xs hover:underline underline-offset-4" to="#">
              Terms of Use
            </Link>
            <Link className="text-xs hover:underline underline-offset-4" to="#">
              Contact Support
            </Link>
          </nav>
        </div>
      </footer> */}
    </div>
  );
}
