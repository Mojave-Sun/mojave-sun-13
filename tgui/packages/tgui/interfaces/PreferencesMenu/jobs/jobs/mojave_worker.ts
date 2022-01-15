import { Job } from "../base";
import { Town } from "../departments";

const TownWorker: Job = {
  name: "Town Worker",
  description: "Provide vital labor for the Town in the form of production, construction, engineering, maintenance. You name it!",
  department: Town,
};

export default TownWorker;
