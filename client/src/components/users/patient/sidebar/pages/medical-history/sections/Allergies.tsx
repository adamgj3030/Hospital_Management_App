import React from "react";
import { useState } from "react";
import { AlertCircle, Plus, Trash2 } from "lucide-react";
import Input from "../../../../../../ui/Input";
import DefaultButton from "../../../../../../ui/buttons/DefaultButton";
import Select from "../../../../../../ui/select/Select";
import SelectItem from "../../../../../../ui/select/SelectItem";

const Allergies = ({ allergies, setAllergies }) => {
  const addAllergy = () => {
    setAllergies([...allergies, { name: "", reaction: null, severity: null }]);
  };

  const removeAllergy = (index: number) => {
    setAllergies(allergies.filter((_, i) => i !== index));
  };
  return (
    <div className="space-y-4">
      <h2 className="text-xl font-semibold flex items-center">
        <AlertCircle className="h-5 w-5 mr-2 text-pink-500" />
        Allergies
      </h2>
      {allergies.map((allergy, index) => (
        <div key={index} className="flex items-center space-x-2">
          <Input
            placeholder="Allergy name"
            value={allergy.name}
            onChange={(e) => {
              const newAllergies = [...allergies];
              newAllergies[index].name = e.target.value;
              setAllergies(newAllergies);
            }}
          />
          <Input
            placeholder="Reaction"
            value={allergy.reaction}
            onChange={(e) => {
              const newAllergies = [...allergies];
              newAllergies[index].reaction = e.target.value;
              setAllergies(newAllergies);
            }}
          />

          <Select
            id="severity"
            name="severity"
            value={allergy.severity}
            onChange={(e) => {
              const newAllergies = [...allergies];
              newAllergies[index].severity = e.target.value;
              setAllergies(newAllergies);
            }}
          >
            <SelectItem value=""> Select Severity</SelectItem>
            <SelectItem value="Mild"> Mild</SelectItem>
            <SelectItem value="Moderate"> Moderate</SelectItem>
            <SelectItem value="Severe"> Severe</SelectItem>
          </Select>

          <DefaultButton
            type="button"
            variant="outline"
            size="icon"
            onClick={() => removeAllergy(index)}
          >
            <Trash2 className="h-4 w-4" />
          </DefaultButton>
        </div>
      ))}
      <DefaultButton type="button" variant="outline" onClick={addAllergy}>
        <Plus className="h-4 w-4 mr-2" />
        Add Allergy
      </DefaultButton>
    </div>
  );
};

export default Allergies;
