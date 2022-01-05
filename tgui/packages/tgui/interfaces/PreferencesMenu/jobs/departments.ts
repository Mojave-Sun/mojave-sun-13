
import ncr_logo from './job_icons/flag_ncr.png';
import bos_logo from './job_icons/flag_brotherhood.png';
import raiders_logo from './job_icons/flag_raiders.png';
import town_logo from './job_icons/flag_towner.png';
import wasteland_logo from './job_icons/flag_wastelanders.png';

export type Department = {
  name?: string;
  head?: string;
  picture?: string;
};

export const Assistant: Department = {
  // "Assistant" is not the head of its own department, as otherwise
  // it would show as large and bold.
};

export const Captain: Department = {
  head: "Captain",
};

export const Cargo: Department = {
  head: "Quartermaster",
};

export const Engineering: Department = {
  head: "Chief Engineer",
};

export const Medical: Department = {
  head: "Chief Medical Officer",
};

export const Security: Department = {
  head: "Head of Security",
};

export const Service: Department = {
  head: "Head of Personnel",
};

export const Science: Department = {
  head: "Research Director",
};

export const Silicon: Department = {
  head: "AI",
};

// MOJAVE EDIT ADDITION BEGIN - Departments
export const NCR: Department = {
  name: "NCR",
  head: "NCR Lieutenant",
  picture: ncr_logo,
};

export const BOS: Department = {
  name: "Brotherhood of Steel",
  head: "Head Paladin",
  picture: bos_logo,
};

export const Raiders: Department = {
  name: "Raiders",
  head: "Raider Boss",
  picture: raiders_logo,
};

export const Town: Department = {
  name: "Town",
  head: "Town Mayor",
  picture: town_logo,
};

export const Wasteland: Department = {
  name: "Wasteland",
  // no head.
  picture: wasteland_logo,
};

// MOJAVE EDIT ADDITION END - Departments
