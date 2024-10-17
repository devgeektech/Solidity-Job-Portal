// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract JobPortal
{
    struct Applicant{
        uint id;
        string name;
        string  laborhistory;
        string skills;
        string availability;
        string otherpersonaldetails;
        uint rating; 
    }
    mapping(uint256 => Applicant)  applicants;
   
    struct Job{
        uint id;
        string jobname;
        string description;
        uint salary;
        address provider;
        uint rating;
    }
    mapping(uint=> Job) jobs;
    
    
    uint256  applicantCount;
    uint256  jobCount;

     // Add a new applicant
    function addApplicant(string memory _name, string memory _laborHistory, string memory _skills, string memory _availability, string memory _otherDetails) public {
        applicantCount++;
        applicants[applicantCount] = Applicant(applicantCount, _name, _laborHistory, _skills, _availability, _otherDetails, 0);
    }

     // Get applicant details
    function getApplicantDetails(uint256 _id) public view returns (uint256, string memory, string memory, string memory, string memory, string memory, uint256) {
        Applicant memory applicant = applicants[_id];
        return (applicant.id, applicant.name, applicant.laborhistory, applicant.skills, applicant.availability, applicant.otherpersonaldetails, applicant.rating);
    }

    // Add a new job to the portal
    function addJob(string memory _jobname, string memory _description, uint256 _salary) public {
        jobCount++;
        jobs[jobCount] = Job(jobCount, _jobname, _description, _salary, msg.sender, 0);
    }

     // Get job details
    function getJobDetails(uint256 _id) public view returns (uint256, string memory, string memory, uint256, address, uint256) {
        Job memory job = jobs[_id];
        return (job.id, job.jobname, job.description, job.salary, job.provider, job.rating);
    }
    
    // Applicants apply for a job
    function applyForJob(uint256 _applicantId, uint256 _jobId) public {
        applicants[_applicantId].rating += 1; // Increase applicant rating
        jobs[_jobId].rating += 1; // Increase job rating
    }



}