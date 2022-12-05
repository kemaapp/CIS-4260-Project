-- -----------------------------------------------------
-- Schema projectdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `project_db`;
CREATE SCHEMA `project_db`;
USE `project_db` ;

--
-- Prep work
--
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `section`;
DROP TABLE IF EXISTS `course`;
DROP TABLE IF EXISTS `department`;
SET FOREIGN_KEY_CHECKS=1;

--
-- Table structure for table `department`
--
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(5) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `course`
--
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(10) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(800) DEFAULT NULL,
  `department_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_department_id` (`department_id`),
  CONSTRAINT `FK_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `section`
--
CREATE TABLE `section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `semester` varchar(6) DEFAULT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_course_id` (`course_id`),
  CONSTRAINT `FK_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- insert data to department
INSERT INTO `department` VALUES 
(1,'CIS','Computer Information Systems'),
(2,'FRL','Finance, Real Estate, and Law');

-- insert data to course
INSERT INTO `course` (number, title, description, department_id) VALUES 
('1010', 'Introduction to Personal Computing', 'Introduction to fundamental computer concepts and personal computing software through classroom and self-directed learning supported by interactive online learning environment. Topics include: Windows environment, word processing, spreadsheet, presentation, database, and computer concepts.', 1),
('2000', 'Special Study for Lower Division Students', 'Individual or group investigation, research, studies, or surveys of selected problems. Proposals to be initiated by student(s) with guidance from faculty. Total credit limited to 6 units, with a maximum of 3 units per semester.', 1),
('2100', 'Programming for Business Analytics', 'Technology and programming foundation for business analytics projects. Programming language under the context of business analytics cases.', 1),
('2201', 'User Experience', 'Design, develop, critique and test user interfaces. Use wire-framing techniques and online web hosting services to build Web interfaces. Test efficiency and effectiveness of Web designs. Learn multimedia tools and design principles for building effective electronic media.', 1),
('2650', 'Contemporary Operating Systems', 'Introduction to contemporary computer operating system fundamentals. File Management, Virtual Memory, User Interface, and Device Management for Windows, OS-X, Linux, and UNIX operating systems. Virtualization of operating systems and processes. Lectures/problem-solving.', 1),
('2670', 'IT Infrastructure', 'Exploration of IT infrastructure and its role in supporting and empowering organizations. Topics include telecommunications, service delivery, service level management, security, privacy, identity management, ethics and contemporary methodologies for managing IT infrastructure.', 1),
('2900', 'Object-Oriented Programming for Business', 'Computer programming for business information systems. Object-oriented programming concepts, Java language, graphics, file operations, and Integrated Development Environment. Business application projects.', 1),
('2990', 'Special Topics for Lower Division Students', 'Group study of a selected well-defined topic or area not covered by a regularly offered course.', 1),
('2990A', 'Special Topics for Lower Division Students Activity', 'Group study of a selected well-defined topic or area not covered by a regularly offered course.', 1),
('2990L', 'Special Topics for Lower Division Students Laboratory', 'Group study of a selected well-defined topic or area not covered by a regularly offered course.', 1),
('3050', 'Database Design and Development', 'Conceptual modeling, database design and implementation. Database inquiry and data analysis using a nonprocedural programming language. Entity/Relationship diagrams, normalized database schema, structured query language. Distributed databases with integrity and security issues. Client server computing.', 1),
('3100', 'Management Information Systems', 'Technological innovation and key business strategies for creating successful Internet startups, including: 1) discovering, evaluating and validating startup opportunity and business model through market research, 2) developing product prototype or MVP using current technology and development methodologies, and 3) launching the product to market through effective Internet marketing channels.', 1),
('3110', 'Client-side Web Development', 'Design and development of interactive and responsive websites using client-side technologies. Application of current HTML standards and multimedia elements for content. Use of modern CSS techniques for presentation style. Integration of JavaScript and JavaScript libraries for rich user experience and interactivity.', 1),
('3150', 'Systems Analysis and Design', 'Introduction to object-oriented systems analysis and design using unified modeling language (UML). System development life cycle. Identification and decision of information system requirements, use cases, use case diagrams, domain models, interaction diagrams, and design class diagrams.', 1),
('3252', 'Business Intelligence', 'Strategic value of information, data acquisition, data compliance and security, data sharing, data visualization, business intelligence, data reporting, digital dashboards. Using data modeling for decision making, data analytics, proprietary and nonproprietary software. Industry cases in marketing, finance, manufacturing, human resources. Future trends of business intelligence. Ethical and Privacy Issues.', 1),
('3350', 'Location Analytics for Business', 'Geographic Information System (GIS) and location analytics for business, spatial data type, spatial data analysis, spatial market analysis, location intelligence of business environment, solve location-based business problems, and ethical and legal aspects of spatial technologies and location data.', 1),
('3454', 'Data Warehousing', 'Designing large databases using advanced data modeling concepts. Producing quality data models which follow corporate business plans, policies, and strategies of the enterprise. Extracting information from different data sources to create data warehouses. Design infocubes. Use in-memory databases. Strategic use of data warehouses. Ethics and privacy challenges.', 1),
('3470', 'Telecommunication Networks', 'Communication networks and the ability of such networks to address business needs. Topics include communications needs analysis, communication network design, software defined networking as well as implementation and testing networks.', 1),
('3650', 'Web and Mobile Analytics', 'Web and mobile analytics studies the collection, analysis, and reporting of the audience, acquisition, behavior, and conversion data from websites and mobile applications, for the purposes of understanding and optimizing digital design, use, and performance. Advanced topics include data visualization, search engine optimization, attribution model, regular expression, tag management, conversion optimization, and the preparation for professional certification exams such as Google Analytics Individual Qualification (GAIQ) test.', 1),
('4000', 'Special Study for Upper Division Students', 'Individual or group investigation, research, studies, or surveys of selected problems at advanced level. Proposals to be initiated by student(s) with guidance from faculty. Total credit limited to 6 units, with a maximum of 3 units per semester. ', 1),
('4230', 'Artificial Intelligence Applications in Business', 'Fundamental Artificial Intelligence concepts and methods. Techniques and tools in Artificial Intelligence for business. Practical Artificial Intelligence applications in Business. Artificial Intelligence projects.', 1),
('4250', 'E-Commerce Application Development', 'Analysis of e-commerce architecture, practice, technology, and trends. Hands-on design and development of e-commerce solutions for modern digital market. Applications of online retailing, payment processing, data interexchange, search engine and social media optimization, and e-commerce security.', 1),
('4260', 'Server-side Web Development', 'Development of web applications and projects for business using various server-side technologies, including Integrated Development Environment, web servers, and interactions with a database.', 1),
('4270', 'Secure Web Applications', 'Identification of web application threats, vulnerabilities, and attacks. Analysis of major web application security risks in practice. Formulation of strategies with implementation plan for countermeasures for secured Web applications. Development of appropriate security mechanisms in the logic, coding, testing, and debugging of web applications.', 1),
('4280', 'Mobile App Programming', 'Fundamental concepts in mobile application development, Integrated Development Environment, business mobile application projects.', 1),
('4290', 'IS Project Management and Development', 'Application of Agile processes, methods, techniques and tools to develop information systems projects. Management of a comprehensive, team-based project development. Client partnership and user experience; team collaboration and communication;documentation and oral presentations.', 1),
('4321', 'Data Mining', 'Data mining algorithms, machine learning to transform data into actionable knowledge. Business data mining projects.', 1),
('4333', 'Information Systems Auditing', 'Fundamentals of Information Systems (IS) auditing. Understanding IS Audits, risk assessment and concepts, professional judgment, ethics, and techniques used in IS audits. Includes case studies on frameworks for the governance and management of enterprise IT.', 1),
('4410', 'Internship in Information Systems', 'Faculty supervised, on-the-job educational experiences in a real world IT environment. Allocation of credit is dependent on the nature of the work done and the number of hours worked. Students usually receive pay for participation. CIS 4410 and CIS 4420 may be taken four times each for a total credit of 16 units; with a maximum of 8 units per semester.', 1),
('4420', 'Internship in Information Systems', 'Faculty supervised, on-the-job educational experiences in a real world data processing environment. Allocation of credit is dependent on the nature of the work done and the number of hours worked. Students usually receive pay for participation. CIS 4410 and CIS 4420 may be taken four times each for a total credit of 16 units; with a maximum of 8 units per semester.', 1),
('4567', 'Big Data Analytics', 'Concepts, techniques, and tools for big data analytics. Data analytics projects.', 1),
('4670', 'Network Security', 'Review of the fundamentals of network security in a business environment. Topics include network security frameworks, measurement and mitigation of risk and best practices in applying security mechanisms from a business perspective.', 1),
('4680', 'Advanced Data Analytics', 'Advanced algorithms, concepts, techniques, and skills in business analytics. Data analytics projects.', 1),
('4710', 'Information Security', 'Introduction to computer security in networked systems. Security issues and policies with regard to hardware, software development, databases, operating systems and networks. Common attacks on systems will be covered. Vulnerability assessment tools and techniques for defending systems will be explored in various projects. Professional responsibilities.', 1),
('4810', 'Computer Forensics', 'Computer forensics methodology. Legal issues regarding digital evidence seizure and chain of custody. Technical issues in acquiring computer evidence and analyzing data. Contemporary file systems are examined. Formal written reports and expert testimony.', 1),
('4990', 'Special Topics for Upper Division Students', 'Group study at an advanced level of a selected well-defined topic or area not covered by a regularly offered course.', 1),
('4990A', 'Special Topics for Upper Division Students Activity', 'Group study at an advanced level of a selected well-defined topic or area not covered by a regularly offered course.', 1),
('4990L', 'Special Topics for Upper Division Students Laboratory', 'Group study at an advanced level of a selected well-defined topic or area not covered by a regularly offered course.', 1),
('1001', 'Personal Money Management', 'Personal financial management including allocation of financial resources and planning of expenditures. Topics include personal budgeting, housing decisions, consumer protection, insurance options, using credit, personal income taxes, savings, investments, and retirement options. The material is applied in settings that are relevant to students. Course fulfills GE area E.', 2),
('1013', 'Law for Everyday Living', 'Legal principles which underlie ordinary transactions such as buying a house or a television, writing a check, getting married, buying real property, taking out an insurance policy, joining a union, lending a car to a friend, signing a lease, wills, estates and hundreds of everyday activities. Course fulfills GE sub-area D3', 2),
('2000', 'Special Study for Lower Division Students', 'Individual or group investigation, research, studies, or surveys of selected problems. Proposals to be initiated by student(s) with guidance from faculty. Total credit limited to 6 units, with a maximum of 3 units per semester.', 2),
('2013', 'The Legal Environment of Business and its Transactions', 'The study of the legal adversarial system, principles of American law, coverage of business-related torts and contracts, strict liability, real/personal property, regulatory environment and criminal law. The law of products liability will also be critically examined', 2),
('2990', 'Special Topics for Lower Division Students', 'Group study of a selected well-defined topic or area not covered by a regularly offered course.', 2),
('2990A', 'Special Topics for Lower Division Students Activity', 'Group study of a selected well-defined topic or area not covered by a regularly offered course.', 2),
('2990L', 'Special Topics for Lower Division Students Laboratory', 'Group study of a selected well-defined topic or area not covered by a regularly offered course.', 2),
('3000', 'Managerial Finance', 'Introduction to functions of finance in business firms. Application of financial decision-making tools, the structure of financial markets, and financial instruments. Covers agency problems, time value of money, bond and stock, capital budgeting, cost of capital and international corporate finance.', 2),
('3062', 'Fundamentals of Real Estate', 'Comprehensive introduction to real estate concepts, principles, and methods related to transactions and decision-making. Topics include the legal aspects of real estate, primary and secondary capital markets and their instruments, appraisal, market and investment analysis, and development.', 2),
('3151', 'Financial Markets and Institutions', 'Introduces different financial institutions and markets. Focuses on risk management through financial markets and instruments from a microeconomics perspective. Discusses the impact of government regulation and monetary policy on financial markets and institutions.', 2),
('3253', 'Contract Administration', 'Organization, procedures, and areas of application in contract administration. Designed to provide the student with knowledge and skills essential to accomplish the responsibility of contract administration. Provides a comprehensive approach to the interrelationship between contract administration and various functional disciplines.', 2),
('3263', 'Contract Aspects of the Uniform Commercial Code', 'Transition from common law background to statutory contract law. Formation of sales contract under the UCC. Insight regarding policy considerations, legal remedies, and the mechanical requirements.', 2),
('3273', 'Contract Case Study Practical Application', 'Review of current and past cases in government and private contracting, using the case study method. Combined class textbook and library assignments. Cases, selected by areas briefed, discussed and reviewed.', 2),
('3283', 'Contract Cost/Price Techniques-Negotiation', 'Cost/price techniques applicable to public and private prime/sub contracts including RFQ-RFP-IFB analysis, proposal preparation, estimating methodology, and pricing strategies. Analytical and econometric techniques in preparing contracts.', 2),
('3293', 'Legal and Contract Management Aspects of Federal Government Contract Property', 'Organization, procedures, and areas of application in basic concepts of Federal Government Contract Property Management including the examination of inherent fundamental legal issues. Further designed to provide the student with knowledge and skills essential to obtaining the National Property Management Association’s Certified Professional Property Specialist (CPPS) certification. Provides a comprehensive approach to the interrelationship between contract property management and various functional disciplines.', 2),
('3301', 'Investments', 'Theories and practices of investment in financial securities, including the process of investing, the securities market structure, fundamental analysis, technical analysis, capital asset pricing, market efficiency, behavioral investment, and use of derivatives.', 2),
('3531', 'International Financial Markets', 'Focuses on international financial markets and institutional management from a microeconomic perspective. Examines relationship between financial institutions and global financial market, and impact of government regulation and monetary policy.
', 2),
('3671', 'Corporate Finance Theory', 'Provides a theoretical framework for corporate finance problems and issues through analytical techniques such as problems, projects, mini-cases. Topics include capital budgeting, CAPM, cost of capital, capital structure, valuation, dividend policy, option, and mergers and acquisitions.', 2),
('3802', 'Real Estate Appraisal', 'Introduction to the fundamentals of real estate valuation for various property types, with a focus on income-producing real estate investments. Topics include: a review of real property concepts; legal rights and constraints; influences on real estate value; urban land economics; fundamental market analysis; site utilization; improvement analysis; and application of 3 valuation approaches.', 2),
('3832', 'Real Estate Finance', 'Instruments of real estate financing and their use, both in the primary and secondary capital markets; analytic factors in financing and investment decision-making; analysis of the various institutions which are sources of real estate financing.', 2),
('3862', 'Real Property Management', 'General practices and legal aspects of property management. Establishing rental schedules, tenant billing, rent collection, lease clauses, lease negotiations, eviction, purchasing procedures related to repairs and maintenance, and property management accounts for all types of income producing properties.', 2),
('4000', 'Special Study for Upper Division Students', 'Individual or group investigation, research, studies, or surveys of selected problems at advanced level. Proposals to be initiated by student(s) with guidance from faculty. Total credit limited to 6 units, with a maximum of 3 units per semester.', 2),
('4013', 'Government Regulation of Business', 'Administrative law is created by administrative agencies in rules, regulations, orders and decisions. The course is a study of economic rights under the U.S. Constitution and administrative law concerning the regulation of corporations and other commercial businesses, professional firms, and nonprofit trade associations. Administrative law, consumer law, environmental law, and alternative dispute resolution are emphasized.', 2),
('4033', 'Law of Financial Transactions', 'Study of the nature, documentary forms, legal implications and rationales of commercial transactions and financial instruments. Covers legal issues confronting international business, with an emphasis on financial transactions and global regulation of financial institutions. Statutory and case law, and applicable principles of contract law are emphasized. Also discussed are principles of debtor-creditor law regarding secured and unsecured realty and personal property transactions, bankruptcy law, and law of investment securities.', 2),
('4041', 'Financial Modeling', 'Implementation of financial theory using advanced Excel spreadsheet. Covers topics in valuation, portfolio management and option models. Utilizes empirical data collection and analysis.', 2),
('4263', 'Legal Aspects of International Business', 'Introduction to the legal aspects of international business, including most importantly: organization forms of international businesses; types of risks in international business and investment transactions; sources of public and private international law; relationship of U.S. and public international law; forms of international trade regulation; principles of international contract law; fundamentals of international trade finance and letters of credit; documentary requirements of international sales, transport and insurance contracts; nature of international business litigation in U.S. courts; and alternative forms of international dispute resolution.
', 2),
('4311', 'Financial Derivatives', 'Explores the pricing of derivatives-based securities. Covers various topics in derivatives markets. Introduces pricing techniques for futures, options, swaps, and other derivatives. Utilizes empirical data and financial modeling. ', 2),
('4401', 'Evaluation of Financial Policy', 'A seminar course in finance utilizing comprehensive cases in areas of financial statement analysis, forecasting, capital budgeting, cost of capital, capital structure, payout policy, and corporate valuation to simulate the role of the financial manager.', 2),
('4411', 'Internship', 'On-the-job training or internship with a business to gain new learning experience. Students submit periodically report to faculty and receive one unit credit for 100 hours of training. May be taken unlimited times.', 2),
('4421', 'Internship 2', 'On-the-job training or internship with a business to gain new learning experience. Students submit periodically report to faculty and receive one unit credit for 100 hours of training. May be taken unlimited times.', 2),
('4531', 'Multinational Financial Management', 'Focuses on the nature, risks, and management of foreign exchange exposure in a corporate setting. Topics include international financial systems, foreign exchange markets, measurement of foreign exchange risk, hedging, international asset pricing, and investing and financing from a global perspective.', 2),
('4601', 'Commercial Banking', 'The knowledge and skills of banking operation and the decision-making tools employed for achieving the desired bank performance goals while considering economic, legal, social, ethical, and technological environment relevant to banking.', 2),
('4611', 'Senior Project', 'Selection and completion of a research project under faculty supervision. Research projects typical of problems that graduate must solve in their fields of employment. Formal report is required. ', 2),
('4631', 'Business Forecasting', 'Integration of the real-word data into the development of theory and empirical analysis in capital and real estate markets. Different forecasting methodologies including smoothing, regression, and Box-Jenkins are combined to find the forecast of a financial variable.', 2),
('4671 ', 'Business Valuation', 'A sound understanding and in-depth framework for business valuation, mergers and acquisitions. Valuation methods and their application in mergers and acquisitions will be demonstrated.', 2),
('4832', 'Real Estate Market Analysis', 'Analyze and collect urban economic and real estate data to prepare market demand studies for use in real estate investment analysis and feasibility studies for (re)development projects.', 2),
('4842', 'Real Estate Law', 'Rights, liabilities, title issues related to the acquisition, possession, use and transfer of real estate interests. Covers issues of easements, licenses, deeds, zoning, leases, variances, mortgages, foreclosure, landlord and tenant relationships and natural resource acquisitions. Topics included are methods of clearing title problems to create marketable title transfer to buyer.', 2),
('4862', 'Real Estate Investment Analysis', 'Techniques for analyzing real estate investments in post-development phase projects. Integration of market analysis, appraisal methods, real estate tax law, techniques to evaluate the risk-return characteristics of investment positions in real properties, and portfolio considerations.', 2),
('4872', 'Practices and Applications of Real Estate Law', 'Ethical and legal responsibilities of the CA real estate broker including listing agreements, structuring of transaction and escrow requirements, supervision of real estate agents, development activities. Covers analysis of common agreements, documents, disclosure statements, financing instruments. Topics include issues of collateral securitization dealing with construction, renovation and development, as well as sales transactions at the close of the project. Each student prepares and presents a course-long project.', 2),
('4902', 'Urban Land Development', 'Principles and processes of developing real properties of all types, emphasizing the approval process, site selection, market and feasibility studies, financial analysis, project/building design, and marketing. Applications through cases, assignments and a major project.', 2),
('4990', 'Special Topics for Upper Division Students', 'Group study at an advanced level of a selected well-defined topic or area not covered by a regularly offered course.', 2),
('4990A', 'Special Topics for Upper Division Students Activity', 'Group study at an advanced level of a selected well-defined topic or area not covered by a regularly offered course.', 2),
('4990L', 'Special Topics for Upper Division Students Laboratory', 'Group study at an advanced level of a selected well-defined topic or area not covered by a regularly offered course.', 2);